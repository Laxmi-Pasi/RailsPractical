Rails.application.routes.draw do
  resources :customers
  resources :orders
  #resources :products
  resources :products, only: [:index, :show, :delete, :new, :create, :edit, :update] do
    collection do
      get :display_all_products
      get :display_products_which_is_active
    end
  end
  #get "products/display_all_product", to:"products#display_all_product"
  root "articles#index"
  get "/articles", to: "articles#index"
end
