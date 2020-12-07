Rails.application.routes.draw do
  get 'users/index'

  resources :loans
  resources :books
  devise_for :users, :path_prefix => 'my'
  resources :users

 
  get 'home/about'

  root 'books#index'
  
end
