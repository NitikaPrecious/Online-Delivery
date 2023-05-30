# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'home#index'
  resources :home, only: [:show, :index]
  resources :restaurants
  resources :items
  resources :carts, only: [:create]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get '/search', to: 'home#search'
end
