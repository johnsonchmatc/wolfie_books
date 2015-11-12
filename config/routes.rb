Rails.application.routes.draw do

  get 'sessions/new'

  get 'static_pages/index'
  
  resources :clients
  resources :projects do
    resources :tasks
  end
  resources :users
 
  get    'login'   => 'sessions#new'
  get    'signup'  => 'users#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  root 'static_pages#index'
end
