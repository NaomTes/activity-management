Rails.application.routes.draw do
  devise_for :customers
  namespace :api do
    namespace :v1 do
      resources :providers
    end
  end
end
