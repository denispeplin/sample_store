require 'rails_helper'

RSpec.describe Product, :type => :model do
  before :each do
    @product = create :product, amount: 20
  end

  shared_examples "movable to order" do
    before :each do
      @order = create :order
      @product.order 5
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
        @product.order 5
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

  context "after being reserved" do
    it "sells itself when reserved in numbers between 1 and #amount" do
      expect(@product).to receive(:order)
      @product.update_attributes(reserve: 5)
    end

    context "refuses to sell with wrong reserve numbers" do
      before :each do
        expect(@product).to_not receive(:order)
      end

      it "when sell amount too big" do
        @product.update_attributes(reserve: 25)
      end

      it "when sell amount too small" do
        @product.update_attributes(reserve: 0)
      end
    end
  end
end
