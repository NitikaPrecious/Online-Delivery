class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :cart_item
  validates :quantity, numericality: { grater_than: 0 }
end
