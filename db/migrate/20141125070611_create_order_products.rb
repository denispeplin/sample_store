class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :amount, null: false
      t.decimal :price, null: false, precision: 8, scale: 2

      t.timestamps
    end
  end
end
