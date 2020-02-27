class AddUserToSubscriberList < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriber_lists, :user, null: true, foreign_key: true
  end
end
