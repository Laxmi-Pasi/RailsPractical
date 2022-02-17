Rails.application.routes.draw do
  resources :categories
  resources :users, except: [:new]
  resources :events, only: [:index, :show, :destroy, :new, :create, :edit, :update] do
    collection do
      get :add_comments
      get :unenroll
    end
  end
  resources :customers
  resources :products, only: [:index, :show, :destroy, :new, :create, :edit, :update] do
    collection do
      get :display_all_products
      get :display_products_which_is_active
      get :most_sales_product_by_quantity
      get :most_sales_product_by_price
    end
  end
  resources :orders, only: [:index, :show, :destroy, :new, :create, :edit, :update] do
    collection do
      get :most_booked_order_of_product
      get :min_cancelled_order_of_product
      get :search_order_by_product_name
    end
  end
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
  get 'signup', to: 'users#new'
  get "login", to: 'sessions#new'
  get "user_events",to: 'users#user_events'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
end
