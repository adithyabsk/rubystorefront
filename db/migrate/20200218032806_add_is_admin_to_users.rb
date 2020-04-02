# frozen_string_literal: true

class AddIsAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isAdmin, :boolean
  end
end
