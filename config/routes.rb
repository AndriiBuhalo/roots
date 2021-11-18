# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'
  devise_for :users
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
