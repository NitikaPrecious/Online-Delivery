Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'items/create'
  get 'items/update'
  get 'items/destroy'
  get 'itemcategory/index'
  get 'building/index'
  get 'building/new'
  get 'building/show'
  get 'building/create'
  get 'building/edit'
  get 'building/update'
  get 'building/destroy'
  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
   
   resources :restaurants
   get '/search', to: 'restaurants#search'
end
