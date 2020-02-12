class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.int :phoneNumber
      t.DateTime :dateOfBirth
      t.string :addressL1
      t.string :addressL2
      t.string :adressL3
      t.string :cardName
      t.long :cardNum
      t.DateTime :cardExpire
      t.int :cardCCV
      t.boolean :isAdmin
      t.boolean :hasSecurePassword

      t.timestamps
    end
  end
end
