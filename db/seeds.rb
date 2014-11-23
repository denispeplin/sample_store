# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

invoice = Invoice.create!

20.times do
  invoice.invoice_products.create!(
    name: Faker::Commerce::product_name,
    amount: Faker::Number.number(2).to_i + 5,
    price: Faker::Commerce::price
  )
end