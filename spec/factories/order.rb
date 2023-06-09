FactoryBot.define do
  factory :order do
    restaurant
    user
    total{100}
   end
end