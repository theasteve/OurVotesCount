class AddIndexToPassengers < ActiveRecord::Migration[5.1]
  def change
    add_index :passengers, [:user_id, :transportation_id], unique: true
  end
end
