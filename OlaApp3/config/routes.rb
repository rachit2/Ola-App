Rails.application.routes.draw do


 	root to: 'ola#home'

  # devise_for :users
	devise_for :users, controllers: { sessions: 'users/sessions', registrations:'users/registrations'}

  resources :ride
	
 
 resources :drivers
 resources :customer
resources :cab
resources :payment


post 'drivers/ride_request', to: 'drivers#ride_request'

end
