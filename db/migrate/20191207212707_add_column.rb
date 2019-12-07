class AddColumn < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :which_user, :string
  end
end