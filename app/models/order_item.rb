class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :cart_item
  validates :quantity, :sub_total, numericality: { grater_than: 0 }
end
