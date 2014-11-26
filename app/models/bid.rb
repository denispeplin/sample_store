class Bid < List
  alias_attribute :placed, :done
  alias_attribute :placed=, :done=
  has_many :bid_products, foreign_key: :list_id
end