class Wishlist < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :items
end
