# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item_category, class_name: 'ItemCategory'
end
