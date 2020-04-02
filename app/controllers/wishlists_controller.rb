# frozen_string_literal: true

class WishlistsController < ApplicationController
  def show
    if session[:user_id].nil?
      redirect_to root_path
    else
      @wishlist_items = current_user.wishlist.items
          end
  end

  def remove_item_from_wishlist
    if session[:user_id].nil?
      redirect_to root_path
    else
      @item = Item.find(params[:id])

      current_user.wishlist.items.delete(@item)
      flash[:alert] = 'Item removed from wishlist'
      redirect_to user_wishlist_path(current_user.wishlist.id, current_user.id)
          end
  end
end
