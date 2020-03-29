# frozen_string_literal: true

class AddUserAndItemToLedgerEntry < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart_items, :ledger_entry_id
    remove_column :ledger_entries, :name
    remove_column :ledger_entries, :email
    remove_column :ledger_entries, :address
    rename_column :ledger_entries, :kind, :status
    add_column :ledger_entries, :total_cost, :decimal
    add_column :ledger_entries, :quantity, :integer
    add_reference :ledger_entries, :user, foreign_key: true
    add_reference :ledger_entries, :item, foreign_key: true
  end
end
