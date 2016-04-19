Rails.application.routes.draw do
  root to: "static_pages#landing"
  get "/auth/and_me/callback", to: "participant/sessions#create"
  get "/researcher_signup", to: "researchers#new", as: :researcher_signup

  resources :researchers, only: [:new, :create]
end
