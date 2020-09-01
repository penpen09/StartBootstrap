Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs do
    post :confirm, on: :collection
  end
  resources :users, only: [:new, :create, :show]
  root to: 'users#top'
  resources :favorites, only: [:create, :destroy, :show]
end
