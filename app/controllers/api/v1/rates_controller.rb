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
        
        # Setup variables
        royal_mail_zone   = country.royal_mail_zone.to_s
        parcel_force_zone = country.parcel_force_zone.to_s
        weight            = params[:weight].to_s
        packaging         = params[:packaging].to_s
        
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
        
        render success(userReturnedRates, nil)
        return
      end
      
      private
      
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