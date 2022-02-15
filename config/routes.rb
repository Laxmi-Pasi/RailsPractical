Rails.application.routes.draw do
  get 'employees/viewEmployeeSummary'
  resources :products
  resources :employees
  resources :authors
  resources :images
  resources :books
  resources :products
  resources :students
  resources :faculties
  root "articles#index"
  get "/articles", to: "articles#index"
end
