class AddItemCollumns < ActiveRecord::Migration[6.0]
  def up
      add_column :items, :brand, :string
      add_column :items, :restricted, :boolean
      add_column :items, :ageRestricted, :boolean
      add_column :items, :quantity, :integer
	  add_column :items, :imageURL, :string
	  add_reference :items, :category, foreign_key: true
  end
end
