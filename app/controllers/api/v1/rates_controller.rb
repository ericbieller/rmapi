module Api
  module V1
    class RatesController < ApiController
      before_filter :authenticate_user!
      respond_to :json
      
      def index
        render success('boom', nil)
        return
      end
      
      private
      
    end
  end
end