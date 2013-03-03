Rmapi::Application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" },
             :controllers => { :omniauth_callbacks => "omniauth_callbacks" }#, :registrations => "registrations" }

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :rates, :only => [:index]
      resources :users do
        collection do
          get :auth
          post :reset_token
        end
      end
    end
  end

  root :to => 'home#index'
  match 'dashboard' => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
