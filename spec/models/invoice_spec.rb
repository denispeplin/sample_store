require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  describe 'may become received' do
    context "when already received" do
      before :each do
        @invoice = create :invoice, received: true
      end

      it "doesn't calls receive! when marked as received" do
        expect(@invoice).to_not receive(:receive!)
        @invoice.update_attributes(received: true)
      end

      it "doesn't calls copy on its products" do
        create :invoice_product, invoice: @invoice
        expect_any_instance_of(InvoiceProduct).to_not receive(:copy)
        @invoice.receive!
      end
    end

    context "when not received" do
      before :each do
        @invoice = create :invoice
      end

      it "calls receive! when marked as received" do
        expect(@invoice).to receive(:receive!)
        @invoice.update_attributes(received: true)
      end

      it "calls copy on all of its products" do
        create :invoice_product, invoice: @invoice
        expect_any_instance_of(InvoiceProduct).to receive(:copy)
        @invoice.receive!
      end
    end
  end
end
