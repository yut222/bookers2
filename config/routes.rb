Rails.application.routes.draw do

  root to: "home#top"
  devise_for :users

  get 'home/about' => 'home#about'

  resources :books, only: [:new, :create, :index, :edit, :show, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end