FactoryBot.define do
  factory :cart_item do
    item
    cart
    quantity{2}
    total{100}
  end
end