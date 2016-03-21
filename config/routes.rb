Rails.application.routes.draw do

  resources :songs, only: [:index, :new, :create, :destroy, :show]
  resources :videos, only: [:index, :new, :create, :destroy, :show]
  root 'homes#index'
  get '/about', to: 'homes#about'
  devise_for :users
end
