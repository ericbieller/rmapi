module Api
  module V1
    class ApiController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      
      private
      def error(status, error_code, details)
        return :status => status, :json =>{
          :error_code  => error_code,
          :details     => details }
      end
      
      def success(object, status = 200)
        return :status => @status, :json => object
      end
    end
  end
end