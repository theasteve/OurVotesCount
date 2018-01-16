class AddStartsAtTimeOfDayToProtests < ActiveRecord::Migration[5.1]
  def change
    add_column :protests, :starts_at_time_of_day, :datetime
  end
end
