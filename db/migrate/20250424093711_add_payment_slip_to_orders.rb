class AddPaymentSlipToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :payment_slip, :string
  end
end
