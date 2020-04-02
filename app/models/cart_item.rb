# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def sub_total_cost
    quantity * item.cost
  end

  def tax
    quantity * item.cost * Category.find(item.category_id).tax_slab
  end

  def total_cost
    sub_total_cost + tax
  end
end
