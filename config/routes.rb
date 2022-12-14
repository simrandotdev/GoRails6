Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"

  # Users Routes
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "passwords_reset#new"
  post "password/reset", to: "passwords_reset#create"

  get "password/reset/edit", to: "passwords_reset#edit"
  patch "password/reset/edit", to: "passwords_reset#update"

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "logout", to: "registration#logout"

  get "login", to: "sessions#new"
  post "login", to: "sessions#login"
  # Root Route
  root to: "main#index"
end
