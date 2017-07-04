class User < ActiveRecord::Migration[5.1]
  def change
    t.string :first_name
    t.string :last_name
    t.string :email
    t.string :password
  end
end
