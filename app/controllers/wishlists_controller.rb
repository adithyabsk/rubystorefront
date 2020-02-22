class WishlistsController < ApplicationController
  def show
    @wishlist_items = current_user.wishlist.items
  end

  def remove_item_from_wishlist
    @item = Item.find(params[:id])
    
    current_user.wishlist.items.delete(@item)
    flash[:alert] = "Item removed from wishlist"
    redirect_to user_wishlist_path(current_user.wishlist.id, current_user.id)
      
  end
end
