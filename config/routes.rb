Rails.application.routes.draw do
  devise_for :users,
    path: 'api/v1/investor/user/',
    controllers: {
      sessions: 'api/v1/investor/user/sessions'
    }
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

        resource :admins, only: [] do
          collection do
            post :bulk_upload_data
            get  :fetch_investors
            get  :fetch_startups
          end
        end

        resources :home, only: [] do
          collection do
            post :contact_us
          end
        end
      end
    end
  end
end
