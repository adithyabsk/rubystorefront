# frozen_string_literal: true

class AddPopularity < ActiveRecord::Migration[6.0]
  def up
    add_column :items, :popularity, :integer, default: 0
  end
end
