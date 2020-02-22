class RenameItemQuantityCol < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :quantity, :inventory
  end
end
