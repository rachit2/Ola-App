Rails.application.routes.draw do

 	root to: 'ola#home'
  devise_for :users

  resources :ride
	
 resources :admin
 resources :driver
 resources :customer
resources :cab

end
