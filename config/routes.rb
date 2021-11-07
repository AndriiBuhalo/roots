Rails.application.routes.draw do
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'

  root :to => "welcome_pages#home"
  
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

end
