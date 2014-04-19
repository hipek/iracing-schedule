Rails.application.routes.draw do
  resources :user_seasons

  resources :series

  resources :seasons

  resources :tracks

  resources :users

  post 'series_track_values/:id', to: 'srs_track_values#update'

  get 'home/index'
  root 'home#index'
end
