class CreateTransportations < ActiveRecord::Migration[5.1]
  def change
    create_table :transportations do |t|
      t.string :pickup_location
      t.string :type
      t.belongs_to  :destination
      t.belongs_to :transporter
    end
  end
end
