Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :providers, except: [:new, :edit]
      resources :customers, except: [:new, :edit]
    end
  end
end
