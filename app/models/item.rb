class Item < ApplicationRecord
	validates :name, presence: true
	validates :cost, presence: true
	validates :brand, presence: true
	validates :quantity, presence: true
	validates :category_id, presence: true
	attribute :restricted, :boolean, default: false
	attribute :age_restricted, :boolean, default: false
end
