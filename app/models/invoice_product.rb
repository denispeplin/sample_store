class InvoiceProduct < ActiveRecord::Base
  belongs_to :invoice

  validates :name, presence: true
  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 1}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
