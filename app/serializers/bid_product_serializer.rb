class BidProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :price
end
