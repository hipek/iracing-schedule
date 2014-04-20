Rails.application.routes.draw do
  resources :teams
  resources :seasons
  resources :tracks
  resources :series

  get 'welcome/index'

  root 'welcome#index'

  post 'series_track_values/:id', to: 'srs_track_values#update'

  scope path: ':team_id' do
    resources :user_seasons

    resources :users

    get 'home/index'

    get '/', to: 'home#index', as: :team_root
  end
end
