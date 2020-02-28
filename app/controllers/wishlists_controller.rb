class WishlistsController < ApplicationController
  def show
	if session[:user_id] == nil 
		redirect_to base_path
	end
    @wishlist_items = current_user.wishlist.items
  end

  def remove_item_from_wishlist
	if session[:user_id] == nil 
		redirect_to base_path
	end
    @item = Item.find(params[:id])
    
    current_user.wishlist.items.delete(@item)
    flash[:alert] = "Item removed from wishlist"
    redirect_to user_wishlist_path(current_user.wishlist.id, current_user.id)
      
  end
end
