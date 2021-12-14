# frozen_string_literal: true

Rails.application.routes.draw do
  # Routes for locale
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  # Regular routes
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'

  concern :attachable do
    resources :attachments, only: :create
  end
  resources :attachments do
    member do
      post 'add_attachment_to_album'
    end
  end
  resources :albums, concerns: [:attachable]

  # Resource routes
  resources :posts

  # Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'welcome_pages#home', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
