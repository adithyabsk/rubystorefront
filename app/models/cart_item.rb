class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def total_cost
    self.quantity * self.item.cost
  end
end
