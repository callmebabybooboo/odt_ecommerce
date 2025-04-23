class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart
    if cart.cart_items.empty?
      redirect_to cart_path, alert: "ไม่มีสินค้าในตะกร้า"
      return
    end

    order = current_user.orders.build(status: "pending")
    total_price = 0

    cart.cart_items.each do |item|
      order.order_items.build(
        product: item.product,
        quantity: item.quantity,
        price: item.product.base_price
      )
      total_price += item.product.base_price * item.quantity
    end

    order.total_price = total_price

    if order.save
      cart.cart_items.destroy_all
      redirect_to order_path(order), notice: "สั่งซื้อสำเร็จ"
    else
      redirect_to cart_path, alert: "เกิดข้อผิดพลาดในการสร้างคำสั่งซื้อ"
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
