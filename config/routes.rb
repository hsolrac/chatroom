Rails.application.routes.draw do
  get 'rooms/index'
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  root "home#index"

  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  resources  :rooms do 
    resource :messages
  end

  get 'users/:id', to: 'users#show', as: :user
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
end
