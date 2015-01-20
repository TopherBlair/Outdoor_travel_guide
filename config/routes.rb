Rails.application.routes.draw do 

root 'static_pages#home'

  get '/help' => 'static_pages#help'

  post 'attractions_search' => 'attractions#api_index', as: 'attractions_search'
  resources :attractions
  resources :reviews
  devise_for :users, :controllers => {registrations: 'registrations' }
end

