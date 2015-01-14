Rails.application.routes.draw do  
  get '/home' => 'static_pages#home'

  get '/help' => 'static_pages#help'

  resources :attractions
  resources :reviews
  devise_for :users, :controllers => {registrations: 'registrations' }
end

