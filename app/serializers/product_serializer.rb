class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :price
end
