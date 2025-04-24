class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.total_price = current_user.cart.cart_items.sum(&:total_price)
    @order.status = 0 # pending

    if @order.save
      # add order items from cart items
      current_user.cart.cart_items.each do |cart_item|
        @order.order_items.create!(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price: cart_item.product.base_price
        )
      end

      # clear cart
      current_user.cart.cart_items.destroy_all

      redirect_to order_path(@order), notice: "สั่งซื้อสำเร็จ!"
    else
      flash.now[:alert] = "ไม่สามารถทำการสั่งซื้อได้"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(
      :delivery_method,
      :shipping_address,
      :shipping_name,
      :phone_number,
      :payment_method
    )
  end
end
