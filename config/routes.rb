Rails.application.routes.draw do
  devise_for :users
  root to: 'ramen#index'
  resources :ramen do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    member do
      get :likes
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

end