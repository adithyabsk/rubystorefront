class User < ApplicationRecord
  has_one :wishlist, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_and_belongs_to_many :subscriber_lists
  has_many :ledger_entries, dependent: :nullify
  has_many :items, :through => :ledger_entries

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
  validates :card_num, presence: true, length: {is: 16}
  validates :card_expire, presence: true, format: {with: /\A([0][0-9]|[1][0-2])[\/][0-2][0-9]\z/, message: "must be format MM/YY"}
  validates :card_ccv, presence: true, length: {is: 3}

  before_create :setup_user_defaults

  private

  def setup_user_defaults
    build_cart
    build_wishlist
    true
  end
end
