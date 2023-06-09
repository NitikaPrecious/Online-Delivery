FactoryBot.define do
  factory :item_category do
    sequence(:name)       {|n| "#{n}" }
  end
end