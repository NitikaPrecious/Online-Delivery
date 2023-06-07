# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :order_items, dependent: :destroy
  validates :total, presence: true
end
