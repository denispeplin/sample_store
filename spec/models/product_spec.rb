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

  describe "adding to bid" do
    before :each do
      @products = Product.all
    end

    context "amount less than minimum" do
      before :each do
        create :setting, name: 'product_min_amount', number: 10
        @product.update_attributes(amount: 5)
      end

      it "creates new bid" do
        expect_any_instance_of(Bid).to receive(:save!)
        @products.create_bid
      end

      it "calculates difference between current and min amount" do
        expect(@product.amount_needed).to be_present
      end

      it "copies itself to bid with amount" do
        expect(BidProduct).to receive(:add).with(kind_of(List), @product, 5)
        @products.create_bid
      end
    end

    context "amount bigger than minimum" do
      after :each do
        @products.create_bid
      end

      it "doesn't creates bid" do
        expect_any_instance_of(Bid).to_not receive(:save!)
      end

      it "doesn't calls BidProduct#add" do
        expect(BidProduct).to_not receive(:add)
      end
    end
  end

  describe "minimum amount calculation" do
    it "gets minumum amount from settings" do
      create :setting, name: 'product_min_amount', number: 17
      expect(@product.min_amount_default).to eq 17
    end

    it "fallback to 0 if minimum amount hasn't been set" do
      expect(@product.min_amount_default).to eq 0
    end
  end
end
