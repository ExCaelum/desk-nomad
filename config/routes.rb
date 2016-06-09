Rails.application.routes.draw do
  root to: "root#show"

  resources :properties, only: [:index, :show]

  resources :cart_properties, only: [:create, :index]
  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get "/:slug", to: "categories#show", as: 'category'

end
