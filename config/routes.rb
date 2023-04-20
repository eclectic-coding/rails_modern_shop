Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "sign_in", to: "users/account#show"
    get "/users", to: "users/account#show" # hack to get devise to work with custom routes
  end

  authenticate :user, lambda { |u| u.role == "admin" } do
    namespace :admin do
      resources :products, except: :destroy do
        collection do
          get "list"
        end
        member do
          get :archive
        end
      end
      resources :users

      root "dashboard#index"
    end
  end

  namespace :users do
    get "account/show"
    root "dashboard#show"
  end

  root to: "static#home"
end
