class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :amount, null: false
      t.string :price, null: false, precision: 8, scale: 2

      t.timestamps
    end
  end
end
