# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list_product do
    list nil
    product nil
    amount 1
    price "9.99"
  end
end
