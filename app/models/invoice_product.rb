class InvoiceProduct < ActiveRecord::Base
  include ProductValidations
  belongs_to :invoice

  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 1}

  def copy
    product = Product.find_by_name(name) ||
      Product.new(attributes.extract!('name', 'amount', 'price'))
    product.amount += amount unless product.new_record?
    product.save!
  end
end
