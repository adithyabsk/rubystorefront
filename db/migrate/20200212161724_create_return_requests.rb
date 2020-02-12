class CreateReturnRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :return_requests do |t|
      t.string :date
	  t.references :item
	  t.references :user
      t.timestamps
    end
  end
end
