require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let (:order){Order.new}
  let (:cart_item){CartItem.new}
  subject {OrderItem .new(quantity: 10, sub_total: 140, order: order, cart_item: cart_item)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a quantity" do
    expect(subject.quantity).to be >0
  end
  it "is not valid without a sub_total" do
    expect(subject.sub_total).to be >0
  end
end
