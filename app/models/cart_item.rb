class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def sub_total_cost
    self.quantity * self.item.cost
  end
  
  def tax
	self.quantity * self.item.cost * Category.find(self.item.category_id).tax_slab
  end
  
  def total_cost
	self.sub_total_cost + self.tax
  end
end
