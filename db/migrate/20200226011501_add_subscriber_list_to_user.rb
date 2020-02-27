class AddSubscriberListToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :subscriber_list, null: true, foreign_key: true
  end
end
