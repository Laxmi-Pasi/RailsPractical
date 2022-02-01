Rails.application.routes.draw do
  resources :authors
  resources :images
  resources :books
  resources :products
  root "articles#index"
  get "/articles", to: "articles#index"
end
