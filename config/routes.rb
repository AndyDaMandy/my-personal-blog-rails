Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :users do
    resources :comments
  end

  get "about", to: "home#about"
  get "home", to: "home#index"
  get "paintings", to: "home#paintings"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
