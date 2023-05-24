class Restaurant < ApplicationRecord
  belongs_to :building
  has_many :items
  
  validates :name, uniqueness: true

end
