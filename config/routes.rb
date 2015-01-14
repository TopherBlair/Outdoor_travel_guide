Rails.application.routes.draw do
  resources :attractions
  devise_for :users
  root to: "home#index"
end
