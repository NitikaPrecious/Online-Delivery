class Restaurant < ApplicationRecord
  has_many :items
  
  validates :description, length: { maximum: 500 ,too_long: "%{count} characters is the maximum allowed"}
  validates :name, uniqueness: true
end
