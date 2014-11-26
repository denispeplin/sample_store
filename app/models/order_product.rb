class OrderProduct < ListProduct
  belongs_to :order, foreign_key: :list_id
end
