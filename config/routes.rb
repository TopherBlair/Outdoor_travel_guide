Rails.application.routes.draw do
	
  resources :reviews
  resources :attractions
  devise_for :users


end

