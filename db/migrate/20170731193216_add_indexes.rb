class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :attendances, [:user_id, :protest_id], unique: true
  end
end
