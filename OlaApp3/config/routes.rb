Rails.application.routes.draw do

 
	root to: 'ola#home'

  devise_for :users
post 'ride/create'
end
