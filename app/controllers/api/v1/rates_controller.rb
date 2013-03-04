module Api
  module V1
    class RatesController < ApiController
      before_filter :authenticate_user!
      respond_to :json
      
      def index
        # Check if weight exists
        if params[:weight].to_i <= 0
          render error(406, 0, [ t('api.errors.invalid_weight') ])
          return
        end
        
        # Check if country code exists
        country = Country.find_by_code(params[:destination])
        if !country
          render error(406, 0, [ t('api.errors.invalid_destination') ])
          return
        end
        
        # Check if country countains zones
        if CountryZone.exists?(:country_id => country.id)
          if params[:destination_zone].nil?
            render error(406, 0, [ t('api.errors.missing_destination_zone') ])
            return
          else
            country_zone = CountryZone.find_by_country_id_and_code(country.id, params[:destination_zone])
            if !country_zone
              render error(406, 0, [ t('api.errors.invalid_destination_zone') ])
              return
            else
              country.parcel_force_zone = country_zone.parcel_force_zone
            end
          end
        end
        
        response_rates = Array.new
        
        # Do services validation
        services = params[:services]
        if services.nil?
          render error(406, 0, [ t('api.errors.rates_api_services_empty') ])
          return
        end
        
        # Setup variables
        royal_mail_zone   = country.royal_mail_zone.to_s
        parcel_force_zone = country.parcel_force_zone.to_s
        weight            = params[:weight].to_s
        
        services.each do |key,service|
          response_rates.push(get_service_rate_or_error(service, royal_mail_zone, parcel_force_zone, weight))
        end
        p response_rates
        return
        
        render success(response_rates, nil)
        return
      end
      
      private
      
      def get_service_rate_or_error(service, rmz, pfz, weight)
        service_id = translate_api_service_to_service_id(service)
        shippingService = ShippingService.find_by_id(service_id)
        if !shippingService
          return create_new_service_response_chunk(:failure, '', service[:type], '', Hash.new, t('api.errors.rates_api_service_not_understood'))
        else
          validation_errors = validate_requested_shipping_service(service)
          
          if validation_errors.count > 0
            return create_new_service_response_chunk(:failure, shippingService.name, service[:type], shippingService.id, Hash.new, validation_errors.join(';'))
          else
            return create_new_service_response_chunk(:success, shippingService.name, service[:type], shippingService.id, create_new_service_rate_response_chunk(7.60), '')  
          end
        end
        
        rates = ShippingRate.find_by_sql("
          SELECT *
          FROM shipping_rates
          WHERE weight >= '" + weight + "'
          AND (royal_mail_zone = '" + royal_mail_zone + "'
            OR parcel_force_zone = '" + parcel_force_zone + "')
          AND (service_id != 11 OR packaging = '" + packaging + "')
          AND (service_id != 13 OR packaging = '" + packaging + "')
          AND (service_id != 1 OR packaging = '" + packaging + "')
          AND (service_id != 2 OR packaging = '" + packaging + "')
        ")
        
        userReturnedRates = filter_rates_by_weight(rates)
      end
      
      def validate_requested_shipping_service(service)
        service_type = service[:type]
        errors = Array.new
        
        case service_type
          when 'express_48'
            if service.has_key?(:large_size) && service[:large_size] == 'true' && service.has_key?(:saturday_delivery) && service[:saturday_delivery] == 'true'
              errors.push(t('api.errors.rates_api_service_express_48_large_size_saturday_delivery_not_supported'))
            end
        end
        
        return errors
      end
      
      def create_new_service_response_chunk(status, service_name, service_type, service_code, rate, message)
        my_hash = {:status => status, :name => service_name, :type => service_type, :code => service_code, :rate => rate, :message => message}
        return my_hash
      end
      
      def create_new_service_rate_response_chunk(amount, currency='GBP')
        return {:amount => amount, :currency => currency}
      end
      
      def translate_api_service_to_service_id(service)
        service_type = service[:type]
        service_id = ''
        case service_type
          when 'airmail'
            if service.has_key?(:intl_signed_for) && service[:intl_signed_for] == 'true'
              service_id = '23'
            else
              service_id = '22'
            end
          when 'airsure'
            service_id = '24'
          when 'surface_mail'
            service_id = '25'
          when '1st_class_mail'
            service_id = '1'
          when '2nd_class_mail'
            service_id = '2'
          when 'special_delivery_9am'
            if service.has_key?(:saturday_guarantee) && service[:saturday_guarantee] == 'true'
              service_id = '4'
            else
              service_id = '3'
            end
          when 'special_delivery_next_day'
            if service.has_key?(:saturday_guarantee) && service[:saturday_guarantee] == 'true'
              service_id = '6'
            else
              service_id = '5'
            end
          when 'standard_parcel'
            service_id = '9'
          when 'express_9'
            if service.has_key?(:saturday_delivery) && service[:saturday_delivery] == 'true'
              service_id = '17'
            else
              service_id = '11'
            end
          when 'express_10'
            if service.has_key?(:saturday_delivery) && service[:saturday_delivery] == 'true'
              service_id = '18'
            else
              service_id = '12'
            end
          when 'express_am'
            if service.has_key?(:saturday_delivery) && service[:saturday_delivery] == 'true'
              service_id = '19'
            else
              service_id = '13'
            end
          when 'express_24'
            if service.has_key?(:saturday_delivery) && service[:saturday_delivery] == 'true'
              service_id = '20'
            else
              service_id = '14'
            end
          when 'express_48'
            if service.has_key?(:large_size) && service[:large_size] == 'true'
              service_id = '16'
            elsif service.has_key?(:saturday_delivery) && service[:saturday_delivery] == 'true'
              service_id = '21'
            else
              service_id = '15'
            end
          when 'global_express'
            service_id = '27'
          when 'global_priority'
            service_id = '28'
          when 'global_value'
            service_id = '29'
          when 'ireland_express'
            service_id = '30'
          when 'hm_forces_worldwide'
            service_id = '32'
          when 'global_economy'
            service_id = '31'
        end
        return service_id
      end
      
      def filter_rates_by_weight(rates)
        finalRates = Hash.new
        rates.each do |rate|
          if !finalRates.has_key?(rate.service_id)
            finalRates[rate.service_id] = Array.new
          end
          finalRates[rate.service_id].push(rate)
        end
        
        userReturnedRates = Hash.new
        finalRates.each do |key,rate|
          lowestWeight = 1000000
          theBestRate = nil
          
          rate.each do |innerRate|
            if innerRate.weight < lowestWeight
              lowestWeight = innerRate.weight
              theBestRate = innerRate
            end
          end
          userReturnedRates[key] = theBestRate
        end
        return userReturnedRates
      end
      
    end
  end
end