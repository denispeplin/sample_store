class ListProduct < ActiveRecord::Base
  belongs_to :list
  belongs_to :product

  delegate :name, to: :product

  def self.add(list, product, amount)
    create!(list_id: list.id, product_id: product.id, price: product.price,
      amount: amount)
  end
end
