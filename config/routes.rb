Rails.application.routes.draw do
  devise_for :users
  resources :expenses
  resources :dashboards, only: [:index]
  resources :categories

  root 'dashboards#index'
end
