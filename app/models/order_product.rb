class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  delegate :name, to: :product

  def self.add(order, product, amount)
    create(order_id: order.id, product_id: product.id, price: product.price,
      amount: amount)
  end
end
