Rails.application.routes.draw do


  root 'gossips#index'

  get '/contact', to: 'static#contact'

  get '/team', to: 'static#team'

  get '/login'     => 'sessions#new'

  post '/login'    => 'sessions#create'

  delete '/logout' => 'sessions#destroy'  
  
  resources :gossips
  resources :users
  resources :cities, only:[:show]
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  
end