class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :received
end
