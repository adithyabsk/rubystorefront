class CheckoutController < ApplicationController
  def show
    @user = current_user
    @cart = @user.cart
  end
  
  def purchase
    current_user.cart.cart_items.each do |cart_item|
      @total = cart_item.item.cost* (1+Category.find(cart_item.item.category_id).tax_slab) * cart_item.quantity
      # add in any discount for over 65 age customers
      is_admin = current_user.is_admin
      status =  (cart_item.item.restricted) ?  "approval_requested" : "purchased"
      LedgerEntry.create!(
        status: status,
        quantity: cart_item.quantity,
        total_cost: @total,
        user_id: current_user.id,
        item_id: cart_item.item.id)
    end
    current_user.cart.cart_items.clear
    redirect_to ledger_entries_index_path(current_user.id)
  end
end
