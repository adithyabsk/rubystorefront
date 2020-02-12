class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :brand
      t.string :name
      t.boolean :restricted
      t.boolean :ageRestricted
      t.integer :quantity
      t.float :cost
      t.string :taxSlab
	  t.string :imageURL
      t.timestamps
	  t.references :category
    end
  end
end
