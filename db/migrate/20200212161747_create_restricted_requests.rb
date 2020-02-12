class CreateRestrictedRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :restricted_requests do |t|
	  t.references :item
	  t.references :user
      t.timestamps
    end
  end
end
