class User < ApplicationRecord
    has_secure_password
    has_one_time_password
    validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true, if: :password
	validates :password_confirmation, presence: true, if: :password
	validates :phone_num, presence: true
	validates :dob, presence: true
	validates :address_l1, presence: true
	validates :address_l2, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :card_name, presence: true
	validates :card_expire, presence: true
	validates :card_ccv, presence: true

end
