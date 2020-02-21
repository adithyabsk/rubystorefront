class Item < ApplicationRecord
	validates :name, presence: true
	validates :cost, presence: true
	validates :brand, presence: true
	validates :quantity, presence: true
	validates :imageURL, presence: true
	validates :category_id, presence: true
end
