# frozen_string_literal: true

class CheckoutController < ApplicationController
  def show
    if current_user.cart.cart_items.empty?
      flash[:alert] = 'You have no items in your cart'
      redirect_to cart_path(current_user.cart.id)
    else
      UserMailer.with(user: current_user).otp_email.deliver_now
      @user = current_user
      @cart = @user.cart
    end
  end

  def purchase
    if current_user.authenticate_otp(params[:otp], drift: 120).nil?
      flash[:alert] = 'OTP is incorrect or has expired'
      redirect_to checkout_show_path
    else
      current_user.cart.cart_items.each do |cart_item|
        @total = cart_item.item.cost * (1 + Category.find(cart_item.item.category_id).tax_slab) * cart_item.quantity
        if ((Time.zone.now - current_user.dob.to_time) / 1.year.seconds).floor > 65
          @total = cart_item.total_cost * 0.9
        else
          @total = cart_item.total_cost
        end
        LedgerEntry.create!(
          quantity: cart_item.quantity,
          total_cost: @total,
          user_id: current_user.id,
          item_id: cart_item.item.id
        )
        cart_item.item.inventory = cart_item.item.inventory - cart_item.quantity
        cart_item.item.popularity = cart_item.item.popularity + cart_item.quantity
        cart_item.item.save
      end
      UserMailer.with(user: current_user, cart_items: current_user.cart.cart_items).purchase_email.deliver_now
      current_user.cart.cart_items.clear
      redirect_to ledger_entries_index_path(current_user.id)
    end
  end

  def send_otp
    UserMailer.with(user: current_user).otp_email.deliver_now
  end
end
