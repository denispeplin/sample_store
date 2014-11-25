require 'rails_helper'

RSpec.describe Product, :type => :model do
  before :each do
    @product = create :product, amount: 20
  end

  shared_examples "movable to order" do
    before :each do
      @order = create :order
      @product.sell 5
    end

    context "adds itself to order" do
      before :each do
        @order_product = @order.order_products.last
      end

      it "with amount" do
        expect(@order_product.amount).to eq 5
      end

      it "with price" do
        expect(@order_product.price).to eq @product.price
      end
    end

    it "reduces amount" do
      expect(@product.amount).to eq 15
    end
  end

  context "when opened order exists" do
    it_behaves_like "movable to order"
  end

  context "when no opened order" do
    context "creates order" do
      before :each do
        @product.sell 5
      end

      after :each do
        expect(Order.current).to be_present
      end

      it "when no orders at all" do
      end

      it "when all orders are sent" do
        create :order, sold: true
      end
    end

    it_behaves_like "movable to order"
  end
end
