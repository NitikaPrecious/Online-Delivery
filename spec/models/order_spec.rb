require 'rails_helper'

RSpec.describe Order, type: :model do
  let (:user){User.new}
  let (:restaurant){Restaurant.new}
  subject {Order.new(total:100, user: user,restaurant: restaurant)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a total" do
    subject.total=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a total" do
    expect(subject.total).to be >0
  end
end
