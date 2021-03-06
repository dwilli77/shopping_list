# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :notifications, only: [:index]

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  root to: 'home#index'
end
