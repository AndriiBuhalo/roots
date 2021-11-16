Rails.application.routes.draw do
  resources :posts
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'
  root :to => "welcome_pages#home"

  resources :album
  resources :attachment
  resources :image_info
  get 'findByTag' => 'attachment#findByTag'
end
