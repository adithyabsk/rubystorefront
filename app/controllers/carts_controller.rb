class CartsController < ApplicationController
  def show
	if session[:user_id] == nil && User.find(params[:id]).id != session[:user_id]
		redirect_to root_path
	end
    @cart = Cart.find(params[:id])
    a = 10
  end

  def empty
    if session[:user_id] == nil || User.find(params[:id]).id != session[:user_id]
		redirect_to root_path
	end
    @cart = current_user.cart
    @cart.cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to root_path
  end
end
