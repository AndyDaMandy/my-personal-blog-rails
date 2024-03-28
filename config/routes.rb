# frozen_string_literal: true

Rails.application.routes.draw do
  resources :portfolios, path: 'portfolio'
  resources :posts do
    resources :comments
  end
  # devise_for :users
  devise_for :users, path_names: {
    sign_up: ''
  }

  get 'about', to: 'home#about'
  get 'home', to: 'home#index'
  get 'paintings', to: 'home#paintings'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
