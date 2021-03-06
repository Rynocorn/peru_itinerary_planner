Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :hotel_stays

      resources :pictures

      resources :activity_signups

      resources :bookings

      resources :cities

      resources :hotels

      resources :activities

      resources :flights

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "flights#index"
  resources :hotel_stays
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
