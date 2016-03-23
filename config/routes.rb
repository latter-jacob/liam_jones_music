Rails.application.routes.draw do
  root 'homes#index'

  resources :songs, only: [:index, :new, :create, :destroy, :show] do
      get 'download' => "songs#download", as: "download"
  end

  resources :videos, only: [:index, :new, :create, :destroy, :show]

  get '/about', to: 'homes#about'

  devise_for :users

end
