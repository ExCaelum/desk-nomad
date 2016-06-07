Rails.application.routes.draw do
  
  resources :properties, only: [:index]

  get "/:slug", to: "categories#show", as: 'category'
end
