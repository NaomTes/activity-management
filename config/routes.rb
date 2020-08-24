Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :provider do
        resources :providers, only: [:update]
        post "login", to: "providers#login"
        post "signup", to: "providers#create"
        get "auto_login", to: "providers#auto_login"
      end
    end
  end
end
