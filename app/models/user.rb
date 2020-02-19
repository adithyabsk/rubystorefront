class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :requests
	has_many :returnrequests
	has_many :restrictedrequests
	validates :name, presence: true
	validates :email, presence: true, format: {with: /\A[a-zA-Z.]+@[a-zA-Z.]+\z/}
	validates :password, presence: true
	validates :phoneNumber, presence: true, length: {is: 10}
	validates :dateOfBirth, presence: true, timeliness: {:on_or_before => lambda { Date.current }, :type => :date}
	validates :addressL1, presence: true
	validates :addressL3, presence: true
	validates :cardName, presence: true
	validates :cardNum, presence: true, length: {in: 12..19}
	validates :cardExpire, presence: true, format: {with: /\A[0-9]{2}\/[0-9]{2}\z/}
	validates :cardCCV, presence: true, numericality: { only_integer: true }, length: {is: 3}
	validates :isAdmin, inclusion: { in: [true, false] }

end
