class Invoice < ActiveRecord::Base
  has_many :invoice_products

  def receive!
    update_attributes received: true
  end
end
