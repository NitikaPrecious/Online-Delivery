# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :orders
  has_many :items, dependent: :destroy
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :name, presence: true
end
