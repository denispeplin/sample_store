class Product < ActiveRecord::Base
  include ProductValidations

  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}

  def order(order_amount)
    transaction do
      order = Order.current || Order.create
      OrderProduct.add(order, self, order_amount)
      self.amount = amount - order_amount
      save!
    end
  end

  def reserve=(order_amount)
    order order_amount if order_amount.between? 1, amount
  end

  def self.bid
    # TODO: implement me
    # create bid and add all products with small amount to bid
  end
end
