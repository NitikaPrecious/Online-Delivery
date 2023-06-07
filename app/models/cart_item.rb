# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  validates :total, presence: true
  validates :quantity, :total, numericality: { grater_than: 0 }
end
