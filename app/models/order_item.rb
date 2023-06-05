class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :cart_item
end
