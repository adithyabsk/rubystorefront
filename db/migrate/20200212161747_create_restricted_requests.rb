class CreateRestrictedRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :restricted_requests do |t|

      t.timestamps
    end
  end
end
