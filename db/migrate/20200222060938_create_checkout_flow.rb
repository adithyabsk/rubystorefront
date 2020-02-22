class CreateCheckoutFlow < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user
      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :cart
      t.references :item
      t.references :ledger_entry

      t.integer :quantity, default: 1
      t.timestamps
    end

    create_table :ledger_entries do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :kind
      t.timestamps
    end
  end
end
