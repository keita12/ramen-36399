Rails.application.routes.draw do
  devise_for :users
  root to: 'ramen#index'
  resources :ramen do
    resources :comments, only: :create
  end
  resources :users, only: :show
end