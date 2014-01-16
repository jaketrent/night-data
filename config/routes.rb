NightData::Application.routes.draw do
  resources :nights
  resources :songs
  resources :scriptures
  resources :activities

  match '/*all', to: 'application#cors_preflight_check', via: [:options]
end
