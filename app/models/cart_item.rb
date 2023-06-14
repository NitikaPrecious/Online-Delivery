# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :orders
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  before_save :set_total

  private

  def set_total
    self.total = item.price * quantity
  end

end
