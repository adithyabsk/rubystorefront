class LedgerEntry < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :status, presence: true, inclusion: {
      in: %w(ordered fulfilled return_requested return_approved approval_requested order_approved),
      message: "%{value} is not a valid status"
  }
end
