Rails.application.routes.draw do

  root to: "homes#top"

  get 'homes/about' => 'homes#about'
  devise_for :users

  resources :books, only: [:new, :create, :index, :edit, :show, :destroy]
  resources :users, only: [:new, :show, :create, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end