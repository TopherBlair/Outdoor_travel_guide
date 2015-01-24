Rails.application.routes.draw do 

root 'static_pages#home'

  get '/help' => 'static_pages#help'
 

  post 'attractions_search' => 'attractions#api_index', as: 'attractions_search'
  get '/attraction_api' => 'attractions#attractions_api', as: 'attraction_api'
 


  resources :attractions
  resources :reviews
  devise_for :users, :controllers => {registrations: 'registrations' }
  resources :users, only: [:show, :index]
end

