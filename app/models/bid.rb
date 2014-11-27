class Bid < List
  alias_attribute :placed, :done
  alias_attribute :placed=, :done=
  has_many :bid_products, foreign_key: :list_id

  def combine=(other_bid_ids)
    transaction do
      BidProduct.where(list_id: other_bid_ids).update_all(list_id: id)
      Bid.where(id: other_bid_ids).destroy_all
    end
  end
end