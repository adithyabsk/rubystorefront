Rails.application.routes.draw do
  resources :restricted_requests
  resources :return_requests
  resources :requests
  resources :feedbacks
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
