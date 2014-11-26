class MoveOrdersToLists < ActiveRecord::Migration
  def up
    execute <<-SQL
      insert into lists (id, created_at, updated_at, done)
      select id, created_at, updated_at, sold from orders;
    SQL
    execute <<-SQL
      insert into list_products (id, list_id, product_id, created_at, updated_at, amount, price)
      select id, order_id, product_id, created_at, updated_at, amount, price from order_products;
    SQL
    drop_table :orders
    drop_table :order_products
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Recreate orders, order_products, copy data back, drop list and list_products to make this reversible"
  end
end
