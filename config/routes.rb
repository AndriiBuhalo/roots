Rails.application.routes.draw do
  resources :posts
  get 'welcome_pages/home'
  get 'welcome_pages/about'
  get 'welcome_pages/contacts'
  root :to => "welcome_pages#home"
<<<<<<< HEAD
  
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

=======
>>>>>>> d640d8316c98cf8085ffd419084be1a749e1016e
end
