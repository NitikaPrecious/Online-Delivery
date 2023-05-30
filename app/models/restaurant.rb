# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :items
  has_many :orders
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :name, uniqueness: true
end
