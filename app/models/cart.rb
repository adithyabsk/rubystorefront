class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def sub_total
    return self.cart_items.sum { |l| l.total_cost}
  end
end

