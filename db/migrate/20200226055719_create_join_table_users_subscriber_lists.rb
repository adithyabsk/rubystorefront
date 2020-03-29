# frozen_string_literal: true

class CreateJoinTableUsersSubscriberLists < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :subscriber_lists do |t|
      t.index %i[user_id subscriber_list_id]
      t.index %i[subscriber_list_id user_id]
    end
  end
end
