NightData::Application.routes.draw do
  resources :nights, except: [:new, :edit]
  resources :songs, except: [:new, :edit]
end
