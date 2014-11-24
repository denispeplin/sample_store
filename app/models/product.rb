class Product < ActiveRecord::Base
  include ProductValidations

  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}
end
