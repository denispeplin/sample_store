require 'rails_helper'

RSpec.describe Order, :type => :model do
  describe "selling invoice" do
    before :each do
      @order = create :order
    end

    it "calls bid on products" do
      expect(Product).to receive(:bid)
      @order.update_attributes(sold: true)
    end
  end
end
