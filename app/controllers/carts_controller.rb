# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    redirect_nonlogged_in
    @cart = Cart.find(params[:id])
  end

  def empty
    redirect_nonlogged_in
    @cart = current_user.cart
    @cart.cart_items.each(&:destroy)
    redirect_to root_path
  end
end
