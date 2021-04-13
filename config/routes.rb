Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :budgets

  root 'budgets#index'

end
