class BidProduct < ListProduct
  belongs_to :bid, foreign_key: :list_id
end