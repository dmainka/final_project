FinalProject::Application.routes.draw do

  resources :customers

  # Home page
  root  'static_pages#home'

  get "static_pages/home", :as => 'home'
  get "static_pages/help", :as => 'help'
  get "static_pages/about", :as => 'about'
  get "static_pages/contact", :as => 'contact'

  # Home page
  # root "products#home"



end
