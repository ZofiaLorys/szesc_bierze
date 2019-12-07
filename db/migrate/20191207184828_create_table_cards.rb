class CreateTableCards < ActiveRecord::Migration[5.0]
  def change
    create_table :table_cards do |t|
      t.references :card, foreign_key: true
      t.integer :row_id
      t.integer :place_in_a_row

      t.timestamps
    end
  end
end
