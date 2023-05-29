Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'itemcategory/index'

  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
   
   resources :restaurants
   resources :items
   get '/search', to: 'restaurants#search'
   get 'home/search'
   get 'cart', to: 'cart#index',as: 'cart'
   post 'cart/add_to_cart', as: 'add_to_card'
   delete 'cart/clear_cart', to: 'cart#clear_cart', as: 'clear-cart'
end
