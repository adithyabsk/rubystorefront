class FixAddress3Name < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :adressL3, :addressL3
  end
end
