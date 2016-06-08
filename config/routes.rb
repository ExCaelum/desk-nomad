Rails.application.routes.draw do
  root to: "root#show"

  resources :properties, only: [:index, :show]

  get "/:slug", to: "categories#show", as: 'category'
end
