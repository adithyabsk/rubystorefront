class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :brand
      t.string :name
      t.boolean :restricted
      t.boolean :ageRestricted
      t.int :quantity
      t.float :cost
      t.string :taxSlab

      t.timestamps
    end
  end
end
