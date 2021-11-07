Rails.application.routes.draw do
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'

  root :to => "welcome_pages#home"
  
  devise_for :users

end
