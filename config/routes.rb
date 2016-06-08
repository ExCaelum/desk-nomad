Rails.application.routes.draw do
  root to: "root#show"
  resources :users, only: [:new]
  resources :properties, only: [:index]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get "/:slug", to: "categories#show", as: 'category'
end
