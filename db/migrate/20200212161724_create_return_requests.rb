class CreateReturnRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :return_requests do |t|
      t.DateTime :date

      t.timestamps
    end
  end
end
