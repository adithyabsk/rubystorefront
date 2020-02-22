class Item < ApplicationRecord
	validates :name, presence: true
	validates :cost, presence: true, numericality: { is_greater_than_or_equal_to: 0 }
	validates :brand, presence: true
	validates :quantity, presence: true, numericality: { is_greater_than_or_equal_to: 0 }
	validates :category_id, presence: true
end
