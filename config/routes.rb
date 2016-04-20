Rails.application.routes.draw do
  root to: "static_pages#landing"
  get "/auth/and_me/callback", to: "participant/users#create"
end
