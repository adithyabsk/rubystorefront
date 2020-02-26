class CheckoutController < ApplicationController
  def show
    @user = current_user
    @cart = @user.cart
  end
end
