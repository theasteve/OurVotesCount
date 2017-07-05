class AddImageColumnsToProtests < ActiveRecord::Migration[5.1]
  def change
    def up
      add_attachment :protests, :image
    end

    def down
      remove_attachment :protests, :image
    end
  end
end
