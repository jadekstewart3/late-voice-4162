Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customers, only: :show
  
  resources :customer_items, only: :create

  resources :items, only: :index

  resources :supermarkets, only: :show
end
