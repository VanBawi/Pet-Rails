Rails.application.routes.draw do
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  # namespace :admin do
  #     resources :users

  #     root to: "users#index"
  #   end

    
  resources :locations
  resources :profiles
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' } 

  root to: 'welcome#show'

  resources :pets
  resources :locations
  
  # resources :users, only: [show, ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
