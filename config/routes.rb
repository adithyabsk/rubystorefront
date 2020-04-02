# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  match 'ledger_entries/index(/:id)' => 'ledger_entries#index', as: 'ledger_entries_index', via: %i[get post]
  # match 'ledger_entries/user_entries/:id' => "ledger_entries#user_entries", as: "ledger_entries_user", via: [:get, :post]

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#empty'

  post 'cart_items/:id/add' => 'cart_items#add_quantity', as: 'cart_item_add'
  post 'cart_items/:id/reduce' => 'cart_items#reduce_quantity', as: 'cart_item_reduce'
  post 'cart_items' => 'cart_items#create'
  get 'cart_items/:id' => 'cart_items#show', as: 'cart_item'
  delete 'cart_items/:id' => 'cart_items#destroy'

  get 'checkout/show'
  post 'checkout/purchase'
  post 'checkout/send_otp'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/index'

  get 'feedbacks/index'
  get 'feedbacks/new'

  resources :carts
  resources :categories, only: %i[index new create show update edit]
  resources :feedbacks
  resources :items do
    member do
      post :disable
      post :enable
      put :add
      get :purchase
    end
  end
  resources :users do
    resources :wishlists
  end
  resources :items
  post 'items/:id/add_user_to_subscriber_list', to: 'items#add_user_to_subscriber_list', as: 'add_user_to_subscriber_list'
  post 'items/:id/add_item_to_wishlist', to: 'items#add_item_to_wishlist', as: 'add_item_to_wishlist'
  post 'wishlists/:id/remove_item_from_wishlist', to: 'wishlists#remove_item_from_wishlist', as: 'remove_item_from_wishlist'
  resources :sessions, only: %i[new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
