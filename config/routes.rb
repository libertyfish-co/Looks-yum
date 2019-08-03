# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'
  resources :foods
  post '/favorite/:id', to: 'favorites#create', as: :favorites
  delete '/favorite/:id', to: 'favorites#destroy', as: :favorite
  get '/user', to: 'users#index'
  get '/auth/facebook/callback', to: 'facebook#auth_done'
  delete '/', to: 'sessions#destroy'
  get '/login', to: 'users#auth_done'
end
