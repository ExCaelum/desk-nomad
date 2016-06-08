Rails.application.routes.draw do
  root to: "root#show"

  resources :users, only: [:new, :create, :show]
  get '/dashboard', to: 'users#show'

  resources :properties, only: [:index]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get "/:slug", to: "categories#show", as: 'category'
end
