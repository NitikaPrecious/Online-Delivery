# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, :description,:address,:phone_1,:phone_2,:minimum_order,:delivery_charge,presence: true
  validates :phone_1, :phone_2, numericality: { only_integer: true }
  validates :phone_1, :phone_2,length: {is: 10}
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :minimum_order, numericality: { grater_than: 0 }
end
