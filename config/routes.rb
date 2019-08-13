Rails.application.routes.draw do
  resources :charges
  namespace :admin do
      resources :users

      root to: "users#index"
    end

  resources :locations
  resources :profiles
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' } 

  root to: 'welcome#show'

  resources :pets
  resources :locations
  resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/billing' => 'billing#index', as: :billing 

  get '/card/new' => 'billing#new_card', as: :add_payment_method
  post "/card" => "billing#create_card", as: :create_payment_method
  get '/success' => 'billing#success', as: :success
end
