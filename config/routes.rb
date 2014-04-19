Rails.application.routes.draw do
  resources :user_seasons

  resources :series

  resources :seasons

  resources :tracks

  resources :users

  root 'users#index'
end
