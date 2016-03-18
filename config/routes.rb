Rails.application.routes.draw do

  resources :songs, only: [:index, :new, :create, :destroy]
  root 'homes#index'
  devise_for :users
end
