require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: "Jack", last_name: "Smith", phone_number: "8889995678", email: "jsmith@sample.com",password:"12345678")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do 
   subject.phone_number=nil  
   expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
   expect(subject.phone_number.length).to eq(10)
  end  
 it "is not valid if the phone number is not all digits" do
   expect((subject.phone_number).match?(/\A-?\d+\Z/)).to eq(true)
  end
end
