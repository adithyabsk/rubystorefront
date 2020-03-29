# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    logged_in?
    @cart = Cart.find(params[:id])
  end

  def empty
    logged_in?
    @cart = current_user.cart
    @cart.cart_items.each(&:destroy)
    redirect_to root_path
  end
end
