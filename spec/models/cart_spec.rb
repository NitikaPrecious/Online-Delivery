require 'rails_helper'

RSpec.describe Cart, type: :model do
  let (:user){User.new}
  subject {Cart .new(total_amount: 100, user: user)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a total_amount" do
    subject.total_amount=nil
    expect(subject).to_not be_valid
  end
   it "is not valid without a total_amount" do
    expect(subject.total_amount).to be >0
  end
end
