class Invoice < ActiveRecord::Base
  has_many :invoice_products

  default_scope { order(:received, created_at: :desc) }

  before_save :receive!, if: lambda { |invoice| invoice.received_changed? and invoice.received }

  def receive!
    transaction do
      invoice_products.each do |invoice_product|
        invoice_product.copy
      end
    end
  end
end
