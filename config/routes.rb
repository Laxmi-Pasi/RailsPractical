Rails.application.routes.draw do
  resources :customers
  #resources :orders
  #resources :products
  resources :products, only: [:index, :show, :delete, :new, :create, :edit, :update] do
    collection do
      get :display_all_products
      get :display_products_which_is_active
      get :most_sales_product_by_quantity
      get :most_sales_product_by_price
    end
  end
  resources :orders, only: [:index, :show, :delete, :new, :create, :edit, :update] do
    collection do
      get :most_booked_order_of_product
      get :min_cancelled_order_of_product
    end
  end
  root "articles#index"
  get "/articles", to: "articles#index"
end
