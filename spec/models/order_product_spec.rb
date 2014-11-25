require 'rails_helper'

RSpec.describe OrderProduct, :type => :model do
  context "may be created for order and product" do
    before :each do
      @order = create :order
      @product = create :product
      @amount = 5
      @order_product = OrderProduct.add(@order, @product, @amount)
    end

    it "belongs to order" do
      expect(@order_product.order).to eq @order
    end

    it "belongs to product" do
      expect(@order_product.product).to eq @product
    end

    it "gets price from product" do
      expect(@order_product.price).to eq @product.price
    end

    it "saves amount" do
      expect(@order_product.amount).to eq @amount
    end
  end
end
