# frozen_string_literal: true

class LedgerEntry < ApplicationRecord
  include AASM

  belongs_to :user, optional: true
  belongs_to :item

  aasm column: :status do
    state :ordered, :return_requested, :return_approved, :return_rejected, :approval_requested, :order_approved, :order_rejected
    initial_state lambda { |ledger_entry|
      ledger_entry.item.restricted? ? :approval_requested : :ordered
    }

    event :request_return, guard: proc { |cu| is_user_transition?(cu) } do
      transitions from: %i[ordered order_approved], to: :return_requested
    end

    event :approve_return, guard: proc { |cu| cu.is_admin? } do
      transitions from: :return_requested, to: :return_approved
    end

    event :reject_return, guard: proc { |cu| cu.is_admin? } do
      transitions from: :return_requested, to: :return_rejected
    end

    event :approve_restricted, guard: proc { |cu| cu.is_admin? } do
      transitions from: :approval_requested, to: :order_approved
    end

    event :reject_restricted, guard: proc { |cu| cu.is_admin? } do
      transitions from: :approval_requested, to: :order_rejected
    end
  end

  def is_user_transition?(current_user)
    is_user?(current_user) || is_admin_ledger?
  end

  def is_user?(current_user)
    !current_user.is_admin?
  end

  def is_admin_ledger?
    user.nil? ? false : user.is_admin?
  end
end
