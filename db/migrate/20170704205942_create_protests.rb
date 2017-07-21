class CreateProtests < ActiveRecord::Migration[5.1]
  def change
    create_table :protests do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :starts_at
      t.references :creator
    end
  end
end
