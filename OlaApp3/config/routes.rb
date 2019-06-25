Rails.application.routes.draw do

 	root to: 'ola#home'

  # devise_for :users
	devise_for :users, controllers: { sessions: 'users/sessions', registrations:'users/registrations'}

  resources :ride
	
 resources :admin
 resources :driver
 resources :customer
resources :cab
resources :payment

end
