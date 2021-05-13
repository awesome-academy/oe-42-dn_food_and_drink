class AddCartIdToDetailOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :detail_orders, :cart_id, :integer
  end
end
