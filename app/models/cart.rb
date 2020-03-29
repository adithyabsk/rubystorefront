# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def sub_total
    cart_items.sum(&:sub_total_cost)
  end

  def tax
    cart_items.sum(&:tax)
  end

  def total_cost
    if ((Time.zone.now - User.find(user_id).dob.to_time) / 1.year.seconds).floor > 65
      cart_items.sum { |item| item.total_cost * 0.9 }
    else
      cart_items.sum(&:total_cost)
    end
  end
end
