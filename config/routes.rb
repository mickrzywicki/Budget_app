Rails.application.routes.draw do
  devise_for :users
  resources :budgets

  root 'budgets#index'

end
