# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :value
      t.integer :negative_points

      t.timestamps
    end
  end
end
