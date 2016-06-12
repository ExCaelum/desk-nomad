Rails.application.routes.draw do
  root to: "root#show"

  resources :properties, only: [:index, :show]

  resources :cart_properties, only: [:create]
  get "/cart", to: "cart_properties#index"
  delete "/cart", to: "cart_properties#destroy"
  patch "/cart", to: "cart_properties#update"

  resources :users, only: [:new, :create, :edit, :update]
  get '/dashboard', to: 'users#show'

  namespace :admin do
   resource :dashboard, only:[:show]
  end

  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get "/:slug", to: "categories#show", as: 'category'

  get '*path' => redirect('/')
end
