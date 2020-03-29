# frozen_string_literal: true

class FixSchemaCategoryItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :taxSlab
    add_column :categories, :tax_slab, :float

    change_column_default :items, :restricted, false
    rename_column :items, :ageRestricted, :age_restricted
    rename_column :items, :imageURL, :image_url
    rename_column :users, :isAdmin, :is_admin
  end
end
