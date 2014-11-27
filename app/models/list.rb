class List < ActiveRecord::Base
  has_many :list_products
  has_many :products, through: :list_products

  default_scope { order(:done, created_at: :desc) }
end
