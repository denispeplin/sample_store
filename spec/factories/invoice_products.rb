FactoryGirl.define do
  factory :invoice_product do
    name Faker::Commerce::product_name
    amount Faker::Number.number(2).to_i + 5
    price Faker::Commerce::price
  end
end