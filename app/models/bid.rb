class Bid < List
  alias_attribute :placed, :done
  alias_attribute :placed=, :done=
  has_many :bid_products, foreign_key: :list_id

  before_save :place, if: lambda { |bid| bid.placed_changed? and bid.placed? }

  def combine=(other_bid_ids)
    transaction do
      BidProduct.where(list_id: other_bid_ids).update_all(list_id: id)
      Bid.where(id: other_bid_ids).destroy_all
    end
  end

  private

  def place
    transaction do
      invoice = Invoice.create!
      bid_products.all.each do |bid_product|
        invoice.invoice_products.create!({
          name: bid_product.name,
          amount: bid_product.amount,
          price: bid_product.price
        })
      end
    end
  end
end