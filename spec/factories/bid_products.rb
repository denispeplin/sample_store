FactoryGirl.define do
  factory :bid_product do
    bid nil
    product nil
    amount Faker::Number.number(2).to_i
    price Faker::Commerce::price
  end
end
