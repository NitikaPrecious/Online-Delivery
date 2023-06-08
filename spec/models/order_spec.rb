require 'rails_helper'

RSpec.describe Order, type: :model do
  let (:user){User.new}
  let (:restaurant){Restaurant.new}
  subject {Order.new(total:100, user: user,restaurant: restaurant)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
