require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let (:item){Item.new}
  let (:cart){Cart.new}
  subject {CartItem .new(quantity: 0, total: 100, item: item, cart:cart)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
   it "is not valid without a quantity" do
    expect(subject.quantity).to be >=0
  end
  it "is not valid without a total" do
    subject.total=nil
    expect(subject).to_not be_valid
  end
   it "is not valid without a total" do
    expect(subject.total).to be >0
  end
end
