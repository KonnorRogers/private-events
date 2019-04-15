# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i[new create show]
end
