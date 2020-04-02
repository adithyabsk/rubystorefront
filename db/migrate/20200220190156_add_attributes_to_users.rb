# frozen_string_literal: true

class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_num, :string
    add_column :users, :dob, :date
    add_column :users, :address_l1, :string
    add_column :users, :address_l2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :card_name, :string
    add_column :users, :card_num, :string
    add_column :users, :card_expire, :string
    add_column :users, :card_ccv, :integer
  end
end
