Rails.application.routes.draw do


  
  get 'static_pages/home'

  get 'static_pages/help'

  resources :attractions
  devise_for :users
  root 'attractions#index'


end

