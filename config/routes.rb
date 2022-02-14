Rails.application.routes.draw do
  resources :products
  resources :events
  root "articles#index"
  get "/articles", to: "articles#index"
end
