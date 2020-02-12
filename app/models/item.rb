class Item < ApplicationRecord
	belongs_to :category
	has_many :requests
	has_many :returnrequests
	has_many :restrictedrequests
	validates :name, presence: true
	validates :brand, presence: true
	validates :restricted, presence: true, inclusion: { in: [true, false] }
	validates :ageRestricted, presence: true, inclusion: {in: [true, false] }
	validates :imageURL, presence: true
	validates :quantity, presence: true, numericality: { only_integer: true, minimum: 0 }
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :taxSlab, presence: true, inclusion: { in: [food, general, alcohol]}
end
