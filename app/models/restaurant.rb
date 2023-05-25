class Restaurant < ApplicationRecord
  belongs_to :building
  has_many :items
  
  validates :description, length: { maximum: 40 ,too_long: "%{count} characters is the maximum allowed"}
  validates :name, uniqueness: true

end
