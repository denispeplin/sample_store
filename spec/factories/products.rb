FactoryGirl.define do
  factory :product do
    name Faker::Commerce::product_name
    amount Faker::Number.number(2).to_i
    price Faker::Commerce::price
  end
end