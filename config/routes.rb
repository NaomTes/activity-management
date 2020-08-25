Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :provider do
        resources :profiles, only: [:create, :update]
        resources :sessions, only: [:create]
        resources :services, only: [:index]
        resources :provided_services, only: [:create, :index]
      end
    end
  end
end
