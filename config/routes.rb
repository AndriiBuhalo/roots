# frozen_string_literal: true

Rails.application.routes.draw do
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }
  resources :posts
  get 'welcome_pages/welcome'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'
  get 'invitations', to: 'invitations#index'
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
