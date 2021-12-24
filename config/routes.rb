# frozen_string_literal: true

Rails.application.routes.draw do
  # Routes for locale
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  # Regular routes
  get 'welcome', to: 'welcome_pages#welcome', as: :welcome
  get 'about', to: 'welcome_pages#about', as: :about
  get 'contacts', to: 'welcome_pages#contacts', as: :contacts

  # Resource routes
  resources :posts
  resources :locations
  resources :important_dates

  # Invitations routes
  get 'invitations', to: 'invitations#index', as: :invitations

  # Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'welcome_pages#welcome', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
