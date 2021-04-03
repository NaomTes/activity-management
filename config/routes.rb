Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :investor do
        resources :investors, only: [:create] do
          collection do
            post :process_results
          end
        end
        resources :startups, only: [:create] do
          collection do 
            post :process_results
          end
        end
      end
    end
  end
end
