Rails.application.routes.draw do 


  root 'static_pages#home'

  get '/help' => 'static_pages#help'
 

  post 'attractions_search' => 'attractions#api_index', as: 'attractions_search'
  get '/attraction_api' => 'attractions#attractions_api', as: 'attraction_api'
 
  get 'oauth/instagram' => 'oauth#instagram', as: 'instagram_oauth'

 	get 'trip_mailer' => 'trips#export_trip', as: 'user_mailer'
 	



  resources :attractions
  resources :reviews
  resources :trips # re route to users page. 
  resources :instagrams, only: :index
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show, :index]

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end

