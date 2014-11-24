require 'rails_helper'

RSpec.describe InvoiceProduct, :type => :model do
  describe 'may be copied to Product' do
    before :each do
      @invoice_product = create :invoice_product
      @invoice_product.copy
    end

    it "creates new, when product with the same name doesn't exists" do
      @invoice_product.attributes.extract!('name', 'amount', 'price').
        should == Product.last.attributes.extract!('name', 'amount', 'price')
    end

    it "increases amount, when product with the same name does exists" do
      @invoice_product.copy
      Product.last.amount.should == @invoice_product.amount * 2
    end
  end
end
