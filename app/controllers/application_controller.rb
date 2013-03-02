class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(user)
   "/dashboard/" #adjust the returned path as needed
  end  
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
