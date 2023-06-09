FactoryBot.define do
  factory :order_item do
    order
    cart_item
    quantity{2}
    sub_total{100}
  end
end