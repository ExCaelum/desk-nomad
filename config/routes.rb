Rails.application.routes.draw do

  get "/:category_name", to: "categories#show", as: 'category'
end
