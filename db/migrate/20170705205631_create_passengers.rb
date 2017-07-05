class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.belongs_to :user
      t.belongs_to :transportation
    end
  end
end
