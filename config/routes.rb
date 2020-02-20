Rails.application.routes.draw do
  root 'items#index'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/index'

  get 'feedbacks/new'

  resources :categories
  resources :feedbacks
  resources :users
  resources :items
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
