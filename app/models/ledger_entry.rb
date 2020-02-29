LedgerStatus = Struct.new(:name, :user_action, :admin_action, :action_type, :next_state) do
  def action_type_match?(action_check)
    action_type == action_check
  end
  def should_disable?(is_admin)
    if (is_admin and not action_type_match?(:admin_action)) \
        or (not is_admin and not action_type_match?(:user_action)) \
        or action_type_match?(:neither_action)
      return true
    else
      return false
    end
  end
  def action_string(is_admin)
    if is_admin
      admin_action
    else
      user_action
    end
  end
end

ORDER_STATUS = {
    :purchased => LedgerStatus.new("Purchased", "Request Return", "None", :user_action, :return_requested),
    :return_requested =>  LedgerStatus.new("Return Requested", "Request Return", "Approve Return", :admin_action, :return_approved),
    :return_approved =>  LedgerStatus.new("Return Approved", "Request Return", "Approve Return", :neither_action, :no_state),
    :approval_requested =>  LedgerStatus.new("Approval Requested", "Request Approval", "Approve Request", :admin_action, :order_approved),
    :order_approved =>  LedgerStatus.new("Order Approved", "Request Return", "Approve Request", :user_action, :return_requested)
}.freeze

class LedgerEntry < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :status, presence: true, inclusion: {
      in: ORDER_STATUS.keys.map{ |k| k.to_s },
      message: "%{value} is not a valid status %{}"
  }

  def status_data
    return ORDER_STATUS[self.status.to_sym]
  end

  def set_next_state!
    if self.status_data.next_state != :no_state
      self.update(status: self.status_data.next_state)
    end
  end
end
