class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.includes(:user).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "อัปเดตสถานะคำสั่งซื้อเรียบร้อยแล้ว"
    else
      redirect_to admin_order_path(@order), alert: "ไม่สามารถอัปเดตสถานะได้"
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
