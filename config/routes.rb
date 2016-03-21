Rails.application.routes.draw do

  resources :songs, only: [:index, :new, :create, :destroy, :show]
  resources :videos, only: [:index, :new, :create, :destroy, :show]
  root 'homes#index'
  devise_for :users
end
