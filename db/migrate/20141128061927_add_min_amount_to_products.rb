class AddMinAmountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :min_amount, :integer
  end
end
