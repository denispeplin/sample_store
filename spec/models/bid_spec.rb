require 'rails_helper'

RSpec.describe Bid, :type => :model do
  before :each do
    @bid = create :bid
    product = create :product
    create :bid_product, bid: @bid, product: product
  end

  describe "may be combined with other bids" do
    before :each do      
      @other_bid = create :bid
      create :bid_product, bid: @other_bid
    end

    it "moves other bids products to itself" do
      @bid.combine = [@other_bid.id]
      expect(@bid.bid_products.count).to eq 2
    end

    it "destroys other bids" do
      expect { @bid.combine = [@other_bid.id] }.
        to change(Bid, :count).by(-1)
    end
  end

  describe "it copies itself to invoices when placed" do
    it "creates invoice" do
      expect { @bid.update_attributes(placed: true) }.
        to change(Invoice, :count).by(1)
    end

    context "copies bid products to invoice" do
      before :each do
        @bid_product = @bid.bid_products.last
        @bid.update_attributes(placed: true)
        @invoice_product = Invoice.last.invoice_products.last
      end

      it "copies name" do
        expect(@bid_product.name).to eq @invoice_product.name
      end

      it "copies amount" do
        expect(@bid_product.amount).to eq @invoice_product.amount
      end

      it "copies price" do
        expect(@bid_product.price).to eq @invoice_product.price
      end
    end
  end
end
