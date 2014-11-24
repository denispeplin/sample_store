class Invoice < ActiveRecord::Base
  has_many :invoice_products

  def receive!
    return if received
    transaction do
      update_attributes received: true
      invoice_products.each do |invoice_product|
        invoice_product.copy
      end
    end
  end
end
