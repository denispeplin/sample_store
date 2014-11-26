class List < ActiveRecord::Base
  has_many :list_products
  has_many :products, through: :list_products
end
