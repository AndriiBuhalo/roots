Rails.application.routes.draw do
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'

  root :to => "welcome_pages#home"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
