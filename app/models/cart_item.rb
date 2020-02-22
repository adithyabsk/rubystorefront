class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :ledger_entry, optional: true

  def total_cost
    self.quantity * self.item.cost
  end
end
