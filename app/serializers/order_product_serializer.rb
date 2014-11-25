class OrderProductSerializer < ActiveModel::Serializer
  attributes :id, :amount, :price
end
