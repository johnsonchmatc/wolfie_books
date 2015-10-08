Rails.application.routes.draw do
  resources :tasks
  resources :clients
  resources :projects
  resources :users
  
  get 'static_pages/index'

  root 'static_pages#index'
end
