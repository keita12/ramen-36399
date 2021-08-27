Rails.application.routes.draw do
  devise_for :users
  root to: 'ramen#index'
  resources :ramen
end