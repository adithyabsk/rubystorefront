# frozen_string_literal: true

class AddDefaultInItem < ActiveRecord::Migration[6.0]
  def change
    change_column_default :items, :age_restricted, false
  end
end
