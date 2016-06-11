Rails.application.routes.draw do
  root to: "root#show"

  resources :properties, only: [:index, :show]

  resources :cart_properties, only: [:create]
  get "/cart", to: "cart_properties#index"
  delete "/cart", to: "cart_properties#destroy"

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  resources :orders, only: [:create, :index, :show]
  # post '/orders', to: "orders#create"
  # get '/orders', to: "orders#index"
  # get '/show', to: "orders#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get "/:slug", to: "categories#show", as: 'category'

end
