class User < ApplicationRecord
	has_one :wishlist, dependent: :destroy
	has_one :cart, dependent: :destroy
        has_and_belongs_to_many :subscriber_lists

	has_secure_password
	has_one_time_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, if: :password
	validates :password_confirmation, presence: true, if: :password
	validates :phone_num, presence: true
	validates :dob, presence: true
	validates :address_l1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :card_name, presence: true
	validates :card_expire, presence: true
	validates :card_ccv, presence: true

	before_create :setup_user_defaults

	private
	def setup_user_defaults
		build_cart
		build_wishlist
		true
	end
end
