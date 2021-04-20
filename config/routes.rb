Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users
  resources :expenses

  root 'dashboards#index'

end
