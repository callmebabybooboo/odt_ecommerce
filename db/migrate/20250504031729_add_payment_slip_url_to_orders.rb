class AddPaymentSlipUrlToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :payment_slip_url, :string
  end
end
