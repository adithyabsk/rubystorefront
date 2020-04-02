# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
