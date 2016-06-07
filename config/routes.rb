Rails.application.routes.draw do
  root to: "root#show"

  resources :properties, only: [:index]

  get "/:slug", to: "categories#show", as: 'category'
end
