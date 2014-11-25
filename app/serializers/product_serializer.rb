class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :price, :reserve

  def reserve
    0
  end
end
