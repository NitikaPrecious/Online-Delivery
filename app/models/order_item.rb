class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  before_save :set_sub_total

  private
  def set_sub_total
    self.sub_total=item.price*quantity 
  end
end
