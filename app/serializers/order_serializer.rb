class OrderSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :sold
  has_many :order_products
end
