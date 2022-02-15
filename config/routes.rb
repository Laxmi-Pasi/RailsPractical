Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :products
  resources :events
  root "articles#index"
  get "/articles", to: "articles#index"
  get 'signup', to: 'users#new'
  get "login", to: 'sessions#new'
  get "user_events",to: 'users#user_events'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
end
