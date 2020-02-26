class CreateSubscriberLists < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriber_lists do |t|
      t.references :item

      t.timestamps
    end
  end
end
