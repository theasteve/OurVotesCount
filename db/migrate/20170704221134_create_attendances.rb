class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :user, index: true 
      t.belongs_to :protest, index: true
    end
  end
end
