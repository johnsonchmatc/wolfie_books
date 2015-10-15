Rails.application.routes.draw do

  get 'sessions/new'

  get 'static_pages/index'

  resources :tasks
  resources :clients
  resources :projects

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy resources :users'
  
  root 'static_pages#index'
end
