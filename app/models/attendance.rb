class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :protest

  validates :user, presence: true, uniqueness: { scope: :protest }
  validates :protest, presence: true
end
