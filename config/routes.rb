Rails.application.routes.draw do
  root "budgets#index"

  resources :budgets
end
