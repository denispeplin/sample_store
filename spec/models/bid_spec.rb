require 'rails_helper'

RSpec.describe Bid, :type => :model do
  describe "may be combined with other bids" do
    before :each do
      @bid = create :bid
      create :bid_product, bid: @bid
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
end
