Rails.application.routes.draw do
  devise_for :users
  resources :expenses

  root 'dashboards#index'
  get 'dashboards/index'
end
