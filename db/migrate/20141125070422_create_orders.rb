class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
