# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item_category, class_name: 'ItemCategory'
  has_many :order_items
  has_many :orders, through: :order_items
  validates :name, :description, :price, :quantity, presence: true
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }            
  validates :price, numericality: { grater_than: 0 }
end
