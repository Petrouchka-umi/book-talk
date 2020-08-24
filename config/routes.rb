Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :messages do
    resources :comments, only: :create
  end
  resources :users, only: [:edit, :update, :show]
end
