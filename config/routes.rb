# frozen_string_literal: true

Rails.application.routes.draw do
  get 'events/new'
  post 'events/create'
  get 'events/show'
  get 'events/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
  resources :events, only: %i[create index show destroy]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
