FactoryBot.define do
  factory :restaurant do
    sequence(:name)    {|n| "#{n}"}
    sequence(:description)   {|n| "first #{n}" }
    address{"Indore"}
    phone_1{"8120517190"}
    phone_2{"4567890987"}
    minimum_order{4}
    delivery_charge{2}
  end
end