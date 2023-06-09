FactoryBot.define do
  factory :item do
    restaurant
    item_category
    sequence(:name)       {|n| "#{n}" }
    sequence(:description)    {|n| "#{n}" }
    price{100}
    quantity{2}
  end
end