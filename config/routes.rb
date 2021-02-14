Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      namespace :provider do
        resources :profiles, only: [:create, :update, :show, :index]
        resources :sessions, only: [:create]
        resources :services, only: [:index]
        resources :provided_services, only: [:create, :index, :show, :update]
        resources :availability_durations, only: [:create]
        resources :availabilities, only: [:index, :show, :destroy]
        resources :booking_requests, only: [:index, :update, :show]
        resources :bookings, only: [:index, :show]
      end
      namespace :customer do
        resources :profiles, only: [:create]
        resources :sessions, only: [:create]
        resources :booking_requests, only: [:create]
        resources :bookings, only: [:index, :show]
        resources :reviews, only: [:create]
        resources :services, only: [:index]
      end

      namespace :investor do
        resources :investors, only: [:create, :index]
        resources :startups, only: [:create, :index]
      end
    end
  end
end
