class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.boolean :received, default: false

      t.timestamps
    end
  end
end
