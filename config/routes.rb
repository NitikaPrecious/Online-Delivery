# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'home#index'
  resources :home, only: [:show, :index]
  resources :restaurants
  resources :items
  resources :carts, only: :index
  resources :cart_items
  resources :orders, only: %i[index new show destroy create]
  get '/search', to: 'home#search'
end
