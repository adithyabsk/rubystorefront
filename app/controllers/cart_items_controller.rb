# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    selected_item = Item.find(params[:item_id])
    cart = current_user.cart
    # Create item if not exist otherwise, increment exisitng cart item
    if cart.items.include?(selected_item)
      @cart_item = cart.cart_items.find_by(item_id: selected_item)
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = cart
      @cart_item.item = selected_item
    end
    # Save cart item and redirect back to cart_path
    if @cart_item.save
      if params[:buynow]
        redirect_to checkout_show_path
      else
        if params[:wishlist]
          redirect_to user_wishlist_path(current_user.id, current_user.wishlist.id), notice: 'Item was successfully added to cart.'
        else
          redirect_to item_path(selected_item.id), notice: 'Item was successfully added to cart.'
        end
      end
    else
      if params[:wishlist]
        redirect_to user_wishlist_path(current_user.id, current_user.wishlist.id), notice: 'Item was not added to cart.'
      else
        redirect_to item_path(selected_item.id), notice: 'Item was not added to cart.'
      end
    end
    # redirect_to cart_path(cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_user.cart)
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(current_user.cart)
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity -= 1 if @cart_item.quantity > 1
    @cart_item.save
    redirect_to cart_path(current_user.cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id)
  end
end
