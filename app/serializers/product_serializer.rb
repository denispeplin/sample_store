class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :min_amount, :amount, :price, :reserve

  def reserve
    0
  end
end
