class InvoiceProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :price
end
