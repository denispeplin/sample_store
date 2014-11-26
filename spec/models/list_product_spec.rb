require 'rails_helper'

RSpec.describe ListProduct, :type => :model do
  context "may be created for list and product" do
    before :each do
      @list = create :list
      @product = create :product
      @amount = 5
      @list_product = ListProduct.add(@list, @product, @amount)
    end

    it "belongs to order" do
      expect(@list_product.list).to eq @list
    end

    it "belongs to product" do
      expect(@list_product.product).to eq @product
    end

    it "gets price from product" do
      expect(@list_product.price).to eq @product.price
    end

    it "saves amount" do
      expect(@list_product.amount).to eq @amount
    end
  end
end
