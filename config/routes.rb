# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'home#index'
  resources :home, only: [:show, :index]
  resources :restaurants
  resources :items, only: [:index, :show]
  resources :carts, only: :index
  resources :cart_items, only: [:create, :destroy]
  resources :orders, only: [:index, :new, :show, :destroy, :create]
  get '/search', to: 'home#search'
end
