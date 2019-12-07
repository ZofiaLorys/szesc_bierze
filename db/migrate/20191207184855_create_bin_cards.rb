# frozen_string_literal: true

class CreateBinCards < ActiveRecord::Migration[5.0]
  def change
    create_table :bin_cards do |t|
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
