class CreateProtests < ActiveRecord::Migration[5.1]
  def change
    create_table :protests do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :starts_at
      t.references :creator, index: true, foreign_key: { to_table: :users }
    end
  end
end
