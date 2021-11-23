# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'
  root to: 'welcome_pages#home'

  resources :attachment
  concern :attachable do
    resources :attachment, only: :create
  end
  resources :album, concerns: [:attachable]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
