Rails.application.routes.draw do
  resources :pictures
  resources :activity_signups
  resources :bookings
  resources :cities
  resources :hotels
  resources :activities
  resources :flights
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
