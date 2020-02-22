Rails.application.routes.draw do
  root 'items#index'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'users/index'

  get 'feedbacks/index'
  get 'feedbacks/new'

  resources :categories
  resources :feedbacks
  resources :items do
	  member do
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
