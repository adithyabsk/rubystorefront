Rails.application.routes.draw do
  root 'items#index'

  get 'ledger_entries/index'
  get 'ledger_entries/show'
  get 'ledger_entries/new'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#empty"

  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
  post 'cart_items' => "cart_items#create"
  get 'cart_items/:id' => "cart_items#show", as: "cart_item"
  delete 'cart_items/:id' => "cart_items#destroy"

  get 'checkout/show'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/index'

  get 'feedbacks/index'
  get 'feedbacks/new'

  resources :ledger_entries
  resources :carts
  resources :categories, only: [:index, :new, :create, :show, :update, :edit]
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
  post 'items/:id/add_item_to_wishlist', to: 'items#add_item_to_wishlist', as: 'add_item_to_wishlist'
  post 'wishlists/:id/remove_item_from_wishlist', to: 'wishlists#remove_item_from_wishlist', as: 'remove_item_from_wishlist'
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
