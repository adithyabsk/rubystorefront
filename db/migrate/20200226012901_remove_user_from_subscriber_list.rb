# frozen_string_literal: true

class RemoveUserFromSubscriberList < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriber_lists, :user_id
  end
end
