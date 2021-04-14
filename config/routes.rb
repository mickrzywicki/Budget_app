Rails.application.routes.draw do
  devise_for :users
  resources :expenses

  root 'expenses#index'

end
