class AddDetailsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :delivery_method, :string
    add_column :orders, :payment_method, :string
    add_column :orders, :shipping_address, :text
    add_column :orders, :shipping_name, :string
    add_column :orders, :phone_number, :string
  end
end
