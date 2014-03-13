FinalProject::Application.routes.draw do

  get "vendors/show"
  match 'cart_items/empty', to: 'cart_items#empty_cart', via: 'delete'

  resources :customers
  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:index, :show]
  resources :books, only: [:index, :show]
  resources :songs, only: [:index, :show]
  resources :cart_items
  resources :orders, only: [:new, :index, :create, :show]
  resources :vendors, only: [:show]
  # resources :order_items, only: [:index, :show]

  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

end
