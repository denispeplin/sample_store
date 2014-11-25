class Product < ActiveRecord::Base
  include ProductValidations

  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}

  def sell(sell_amount)
    transaction do
      order = Order.current || Order.create
      OrderProduct.add(order, self, sell_amount)
      self.amount = amount - sell_amount
      save!
    end
  end

  def reserve=(sell_amount)
    sell sell_amount if sell_amount >= 1 and sell_amount <= amount
  end
end
