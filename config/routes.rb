NightData::Application.routes.draw do
  devise_for :users
  root to: 'nights#index'

  resources :nights
  resources :songs
  resources :scriptures
  resources :activities

  match '/*all', to: 'application#check_preflight', via: [:options]
end
