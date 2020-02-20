class User < ApplicationRecord
    has_secure_password
    has_one_time_password
    validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true, if: :password
	validates :password_confirmation, presence: true, if: :password

end
