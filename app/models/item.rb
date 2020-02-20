class Item < ApplicationRecord
	validates :name, presence: true
	validates :cost, presence: true
end
