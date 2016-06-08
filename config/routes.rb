Rails.application.routes.draw do
  root to: "root#show"

  resources :properties, only: [:index, :show]
  resources :cart_properties, only: [:create]

  get "/:slug", to: "categories#show", as: 'category'
end
