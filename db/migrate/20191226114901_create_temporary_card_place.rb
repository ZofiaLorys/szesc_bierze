class CreateTemporaryCardPlace < ActiveRecord::Migration[5.0]
  def change
    create_table :temporary_card_places do |t|
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true
      t.integer :row

      t.timestamps
    end
  end
end
