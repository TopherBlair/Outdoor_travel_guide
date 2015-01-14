Rails.application.routes.draw do
  resources :attractions
  devise_for :users, :controllers => {registrations: 'registrations' }


root 'attractions#index'

end

