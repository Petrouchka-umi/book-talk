Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :messages do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  #  [:edit, :update, :show]
end
