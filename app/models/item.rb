# frozen_string_literal: true

class Item < ApplicationRecord
  has_and_belongs_to_many :wishlists
  has_many :ledger_entries
  has_many :users, through: :ledger_entries

  has_one :subscriber_list
  has_many :users, through: :subscriber_list
  validates :name, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :brand, presence: true
  validates :inventory, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category_id, presence: true
  validates :image_url, format: { with: /\A.*(.png|.jpg)\z/ }, allow_nil: true

  before_create :build_default_subscriber_list

  private

  def build_default_subscriber_list
    build_subscriber_list
    true
  end
end
