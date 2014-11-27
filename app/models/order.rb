class Order < List
  alias_attribute :sold, :done
  alias_attribute :sold=, :done=
  has_many :order_products, foreign_key: :list_id

  before_save :products_bid, if: lambda { |order| order.sold_changed? and order.sold }

  scope :not_sold, -> { where(sold: false) }

  def self.current
    not_sold.last
  end

  private

  def products_bid
    products.create_bid
  end
end
