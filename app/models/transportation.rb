class Transportation < ApplicationRecord
  belongs_to :destination, class_name: :Protest
  belongs_to :transporter, class_name: :User

  has_many :passengers
  has_many :users, through: :passengers
end
