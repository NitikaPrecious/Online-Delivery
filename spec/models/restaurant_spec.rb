require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject {Restaurant .new(name: "Bagwan", description: "best hotel", address: "Indore", phone_1: "4567890234",phone_2:"1234567800",minimum_order:"4",delivery_charge:"20")}
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
    expect(subject.description.length).is_at_most(500).
    with_long_message('Secret key must be less than 100 characters')
  end
  it "is not valid without a address" do 
   subject.address=nil  
   expect(subject).to_not be_valid
  end
  it "is not valid without a phone_1" do 
    subject.phone_1=nil  
    expect(subject).to_not be_valid
   end
  it "is not valid if the phone_1  is not 10 chars" do
   expect(subject.phone_1.length).to eq(10)
  end  
 it "is not valid if the phone_1  is not all digits" do
   expect((subject.phone_1).match?(/\A-?\d+\Z/)).to eq(true)
  end
  it "is not valid without a phone_2" do 
    subject.phone_2=nil  
    expect(subject).to_not be_valid
   end
  it "is not valid if the phone_2  is not 10 chars" do
   expect(subject.phone_2.length).to eq(10)
  end  
 it "is not valid if the phone_2  is not all digits" do
   expect((subject.phone_2).match?(/\A-?\d+\Z/)).to eq(true)
  end
end
