class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    a = 10
  end

  def empty
    @cart = current_user.cart
    @cart.cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to root_path
  end
end
