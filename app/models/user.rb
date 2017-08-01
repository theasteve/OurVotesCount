class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email,  presence: true

  has_many :protests, foreign_key: :creator_id

  has_many :attendances
  has_many :attended_protests, through: :attendances, source: :protest

  has_many :passengers
  has_many :transportations, through: :passengers

  def attending?(protest)
    if Attendance.exists?(user_id: self.id, protest_id: protest.id)
      return true
    else
      return false
    end
  end
end
