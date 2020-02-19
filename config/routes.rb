Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :categories
  resources :restricted_requests
  resources :return_requests
  resources :requests
  resources :feedbacks
  resources :items
  resources :users
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
