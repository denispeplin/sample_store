class MoveOrdersToLists < ActiveRecord::Migration
  def up
    execute <<-SQL
      insert into lists (type, id, created_at, updated_at, done)
      select 'Order', id, created_at, updated_at, sold from orders;
    SQL
    execute <<-SQL
      insert into list_products (type, id, list_id, product_id, created_at, updated_at, amount, price)
      select 'OrderProduct', id, order_id, product_id, created_at, updated_at, amount, price from order_products;
    SQL
    drop_table :orders
    drop_table :order_products
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Recreate orders, order_products, copy data back, drop list and list_products to make this reversible"
  end
end
