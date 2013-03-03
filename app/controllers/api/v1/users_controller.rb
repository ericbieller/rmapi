module Api
  module V1
    class UsersController < ApiController
      before_filter :authenticate_user!
      respond_to :json
      
      def auth
        email = params[:email]
        password = params[:password]
        
        if request.format != :json
          render error(406, 0, [ t('api.errors.invalid_request') ])
          return
        end
  
        if email.nil? or password.nil?
          render error(400, 0, [ t('api.errors.missing_credentials') ])
          return
        end
    
        user = User.find_by_email(email.downcase)
    
        if user.nil?
          render error(400, 0, [ t('api.errors.invalid_credentials') ])
          return
        end
    
        user.ensure_authentication_token!
    
        if user.valid_password?(password)
          render success([:auth_token => user.authentication_token, :user => user], nil)
        else
          render error(401, 0, [ t('api.errors.invalid_credentials') ])
          return
        end
      end
      
      def reset_token
      end
      
      private
      
    end
  end
end