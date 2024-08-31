# frozen_string_literal: true

Rails.application.routes.draw do
  resources :media
  resources :artworks
  resources :portfolios, path: 'portfolio'
  resources :posts
  get 'rss_feed', to: 'posts#rss_feed', format: 'xml'
  resources :links
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
