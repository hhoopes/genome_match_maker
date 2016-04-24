Rails.application.routes.draw do
  root to: "static_pages#landing"
  get "/auth/and_me/callback", to: "participant/users#create"
  delete "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  namespace :researcher do
    resources :users, only: [:new]
    resources :studies, only: [:new, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/verify_location/:id", to: "verify_location#show"
    end
  end

  namespace :participants do
  end

  resources :studies, only: [:show]

  get "/dashboard", to: "users#show"
  post "/researcher_signup", to: "researcher/users#create"
end
