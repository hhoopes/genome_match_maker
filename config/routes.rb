Rails.application.routes.draw do
  root to: "static_pages#landing"
  delete "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/about", to: "static_pages#about", as: "about"
  get "/auth/and_me/callback", to: "participant/users#create"

  resources :users, only: [:edit, :update, :delete]
  
  namespace :researcher do
    resources :users, only: [:new]
    resources :studies, only: [:new, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/verify_location/:id", to: "verify_location#show"
    end
  end

  resources :studies, only: [:show, :index]

  get "/dashboard", to: "users#show"
  post "/researcher_signup", to: "researcher/users#create"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_token]
  Sidekiq::Web.set :sessions, Rails.application.config.session_options
end
