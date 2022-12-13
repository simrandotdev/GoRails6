Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"
  # Users Routes
  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"
  get "logout", to: "registration#logout"
  # Root Route
  root to: "main#index"
end
