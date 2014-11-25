# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_product do
    order nil
    product nil
    amount 1
    price "9.99"
  end
end
