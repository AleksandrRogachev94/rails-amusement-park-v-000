Rails.application.routes.draw do

  root 'static#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#new', as: "new_ride"

  resources 'users'
  resources 'attractions'
end
