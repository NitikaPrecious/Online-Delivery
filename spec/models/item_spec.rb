require 'rails_helper'

RSpec.describe Item, type: :model do
  let (:restaurant){Restaurant.new}
  let (:item_category){ItemCategory.new}
  subject {Item .new(name: "pizza", description: "best food", price: 100, restaurant: restaurant,item_category:item_category,quantity:4)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    expect(subject.description.length).to be <=500
  end
  it "is not valid without a price" do
    subject.price=nil
    expect(subject).to_not be_valid
  end
   it "is not valid without a price" do
    expect(subject.price).to be >0
  end
  it "is not valid without a quantity" do
    subject.quantity=nil
    expect(subject).to_not be_valid
  end
   it "is not valid without a quantity" do
    expect(subject.quantity).to be >0
  end
end
