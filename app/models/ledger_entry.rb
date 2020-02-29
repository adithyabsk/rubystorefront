class LedgerEntry < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :item

  aasm column: :status do
    state :ordered, :return_requested, :return_approved, :approval_requested, :order_approved
    initial_state lambda { |ledger_entry|
      ledger_entry.item.restricted? ? :approval_requested : :ordered
    }

    event :request_return, guard: Proc.new {|cu| is_user_transition?(cu) } do
      transitions from: [:ordered, :order_approved], to: :return_requested
    end

    event :approve_return, guard: Proc.new {|cu| cu.is_admin? }  do
      transitions from: :return_requested, to: :return_approved
    end

    event :approve_restricted, guard: Proc.new {|cu| cu.is_admin? }  do
      transitions from: :approval_requested, to: :order_approved
    end
  end

  def is_user_transition?(current_user)
    is_user?(current_user) or is_admin_ledger?
  end

  def is_user?(current_user)
    not current_user.is_admin?
  end

  def is_admin_ledger?
    user.is_admin?
  end
end
