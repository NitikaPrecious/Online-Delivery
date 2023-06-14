# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item_category, class_name: 'ItemCategory'
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items, dependent: :destroy
  validates :name, :description, :price, presence: true
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }            
  validates :price, numericality: { grater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
