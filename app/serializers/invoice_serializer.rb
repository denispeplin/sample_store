class InvoiceSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :created_at, :received
  has_many :invoice_products
end
