require 'sidekiq/web'

Rails.application.routes.draw do
  resources :notes
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'notes#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
