Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :messages, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
  resources :comments, only: :create
end
