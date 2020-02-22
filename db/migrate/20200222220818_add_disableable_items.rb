class AddDisableableItems < ActiveRecord::Migration[6.0]
  def up
	add_column :items, :disabled, :boolean, :default => false
  end
end
