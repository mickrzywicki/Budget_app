Rails.application.routes.draw do
  devise_for :users
  resources :dashboards, only: [:index]
  resources :categories
  resources :expenses

  root 'dashboards#index'
end
