Rails.application.routes.draw do
  resources :series

  resources :seasons

  resources :tracks

  resources :users

  root 'users#index'
end
