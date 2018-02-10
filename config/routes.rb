Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :users
  resources :origins
  resources :tastings

  resources :profiles do
    resources :tastings
  end
end
