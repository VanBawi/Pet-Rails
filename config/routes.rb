Rails.application.routes.draw do
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'users#index'

  resources :posts
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
