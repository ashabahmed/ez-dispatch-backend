Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :dispatchers
  resources :companies
  resources :drivers
  resources :vehicles
  resources :accounts
  resources :bookings
  

end
