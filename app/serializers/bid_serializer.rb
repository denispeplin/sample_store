class BidSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :placed
  has_many :bid_products
end
