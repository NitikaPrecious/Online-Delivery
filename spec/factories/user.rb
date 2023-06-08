FactoryBot.define do
  factory :user do
    sequence(:email)    {|n| "user#{n}@gmail.com"}
    sequence(:first_name)       {|n| "first #{n}" }
    sequence(:last_name)        {|n| "last #{n}" }
    address{"Indore"}
    phone_number{"8120517190"}
    password {"user123"}
  end
end