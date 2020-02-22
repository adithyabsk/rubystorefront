class Item < ApplicationRecord
	has_and_belongs_to_many :wishlists
	validates :name, presence: true
	validates :cost, presence: true, numericality: { is_greater_than_or_equal_to: 0 }
	validates :brand, presence: true
	validates :inventory, presence: true, numericality: { is_greater_than_or_equal_to: 0 }
	validates :category_id, presence: true
	validates :image_url, format: { with: /\A.*(.png|.jpg)\z/ }

end
