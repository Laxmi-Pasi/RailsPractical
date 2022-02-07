Rails.application.routes.draw do
  # get 'employees/index'
  # get 'employees/new'
  # get 'employees/show'
  # get 'employees/edit'
  get 'employees/viewEmployeeSummary'
  resources :products
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  get "/articles", to: "articles#index"
end
