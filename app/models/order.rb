class Order < ActiveRecord::Base
  has_many :order_products

  scope :not_sold, -> { where(sold: false) }

  def self.current
    not_sold.last
  end
end
