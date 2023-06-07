# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  validates :total_amount, numericality: { grater_than: 0 }
end
