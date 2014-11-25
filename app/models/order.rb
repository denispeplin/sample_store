class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, through: :order_products

  before_save :products_bid, if: lambda { |order| order.sold_changed? and order.sold }

  scope :not_sold, -> { where(sold: false) }

  def self.current
    not_sold.last
  end

  private

  def products_bid
    products.bid
  end
end
