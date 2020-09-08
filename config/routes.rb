Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      namespace :provider do
        resources :profiles, only: [:create, :update]
        resources :sessions, only: [:create]
        resources :services, only: [:index]
        resources :provided_services, only: [:create, :index, :show, :update]
        resources :availability_durations, only: [:create]
        resources :availabilities, only: [:index, :show, :destroy]
      end
      namespace :customer do
        resources :profiles, only: [:create]
        resources :sessions, only: [:create]
      end
    end
  end
end
