Rails.application.routes.draw do
 
  resources :users
  resources :authors
  resources :images
  resources :books
  resources :products
  resources :students
  resources :faculties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  get "/articles", to: "articles#index"
end
