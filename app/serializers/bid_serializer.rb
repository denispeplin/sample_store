class BidSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :placed, :combine
  has_many :bid_products

  def combine
    []
  end
end
