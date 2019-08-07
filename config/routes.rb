Rails.application.routes.draw do
  resources :locations
  resources :profiles
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' } 

  root to: 'welcome#show'

  resources :pets
  resources :locations
  
  # resources :users, only: [show, ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
