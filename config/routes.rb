Rails.application.routes.draw do


  
  get 'home' => 'static_pages#home'

  get 'help' => 'static_pages#help'

  resources :attractions
  devise_for :users
  


end

