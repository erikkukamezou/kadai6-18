Rails.application.routes.draw do
  get '/pictures', to: 'pictures#index'
  resources :pictures
  get 'sessions/new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
