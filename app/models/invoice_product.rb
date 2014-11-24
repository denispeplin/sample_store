class InvoiceProduct < ActiveRecord::Base
  include ProductValidations
  belongs_to :invoice

  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 1}
end
