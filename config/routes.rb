Rails.application.routes.draw do

  root to: 'sessions#new'

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  get '/home', to: 'home#index'

  get '/session/new', to: 'sessions#new', as: :login
  delete '/session/destroy', to: 'sessions#destroy', as: :logout

  resources :users, only: :index

end
