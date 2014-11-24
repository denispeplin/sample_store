require 'rails_helper'

RSpec.describe Invoice, :type => :model do
  describe 'may become received' do
    context "when already received" do
      it "doesn't mark itself as received" do
        invoice = create :invoice, received: true
        updated_at = invoice.updated_at
        invoice.receive!
        expect(invoice.updated_at).to eq updated_at
      end
    end

    context "when not received" do
      it 'marks itself as received' do
        invoice = create :invoice
        invoice.receive!
        expect(invoice).to be_received
      end
    end
  end
end
