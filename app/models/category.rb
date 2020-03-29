# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, format: { with: /[a-zA-Z ]*/ }, presence: true
  validates :tax_slab, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
