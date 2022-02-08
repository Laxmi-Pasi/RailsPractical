Rails.application.routes.draw do
  resources :authors
  resources :images
  resources :books
  resources :products
<<<<<<< HEAD
  resources :students
  resources :faculties
=======
>>>>>>> d624882100b8bd72346d3bce20bac6fb96d2a722
  root "articles#index"
  get "/articles", to: "articles#index"
end
