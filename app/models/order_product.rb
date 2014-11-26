class OrderProduct < ListProduct
  belongs_to :order, foreign_key: :list_id

  delegate :name, to: :product

  def self.add(order, product, amount)
    create(list_id: order.id, product_id: product.id, price: product.price,
      amount: amount)
  end
end
