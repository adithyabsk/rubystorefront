class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :password
      t.string :phoneNumber
      t.string :dateOfBirth
      t.string :addressL1
      t.string :addressL2
      t.string :adressL3
      t.string :cardName
      t.string :cardNum
      t.string :cardExpire
      t.integer :cardCCV
      t.boolean :isAdmin
      t.boolean :hasSecurePassword

      t.timestamps
    end
  end
end
