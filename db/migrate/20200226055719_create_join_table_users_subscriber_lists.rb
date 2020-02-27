class CreateJoinTableUsersSubscriberLists < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :subscriber_lists do |t|
       t.index [:user_id, :subscriber_list_id]
       t.index [:subscriber_list_id, :user_id]
    end
  end
end
