Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      namespace :investor do
        resources :investors, only: [:create] do
          post "process_results", on: :collection
        end
        resources :startups, only: [:create] do 
          post 'process_results', on: :collection
        end
      end
    end
  end
end
