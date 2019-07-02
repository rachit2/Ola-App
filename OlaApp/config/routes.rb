# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'ola#home'

  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :ride
  resources :ola
  resources :admin
  resources :drivers
  resources :customer
  resources :cab
  resources :payment

  get 'book_a_cab', to: 'customer#book_a_cab'
  post 'book_a_cab', to: 'customer#book_a_cab'

  get 'ride_request', to: 'drivers#ride_request'

  get 'accept_ride', to: 'drivers#accept_ride'
  get 'cancel_ride', to: 'ride#cancel_ride' 

end
