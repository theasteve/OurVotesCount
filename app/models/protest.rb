class Protest < ApplicationRecord
  validates :name, :description, :location,
            :starts_at, :creator, presence: true

  has_attached_file :image, styles: {thumb: "100x100#",
                                     medium: "400x600#" },
                                     default_url: ":style/missing.png"
                                     
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :creator, class_name: :User

  has_many :attendances
  has_many :users, through: :attendances

  has_many :transportations
end
