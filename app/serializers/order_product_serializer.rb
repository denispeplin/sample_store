class OrderProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :price
end
