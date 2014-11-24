require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  describe 'may become received' do
    context "when already received" do
      before :each do
        @invoice = create :invoice, received: true
      end

      it "doesn't mark itself as received" do
        updated_at = @invoice.updated_at
        @invoice.receive!
        expect(@invoice.updated_at).to eq updated_at
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

      it 'marks itself as received' do
        @invoice.receive!
        expect(@invoice).to be_received
      end

      it "calls copy on all of its products" do
        create :invoice_product, invoice: @invoice
        expect_any_instance_of(InvoiceProduct).to receive(:copy)
        @invoice.receive!
      end
    end
  end
end
