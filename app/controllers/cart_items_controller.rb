class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :set_cart_item, only: [ :update, :destroy ]

  def create
    @cart = current_user.cart || current_user.create_cart
    @product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_by(product: @product)

    if @cart_item
      @cart_item.increment!(:quantity)
    else
      @cart.cart_items.create(product: @product, quantity: 1)
    end

    redirect_to cart_path, notice: "เพิ่มสินค้าในตะกร้าเรียบร้อยแล้ว"
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: "ลบสินค้าออกจากตะกร้าเรียบร้อยแล้ว"
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(quantity_params)
      redirect_to cart_path, notice: "อัปเดตจำนวนสินค้าเรียบร้อยแล้ว"
    else
      redirect_to cart_path, alert: "ไม่สามารถอัปเดตจำนวนสินค้าได้"
    end
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

  def set_cart_item
    @cart_item = @cart.cart_items.find_by(id: params[:id])
    unless @cart_item
      redirect_to cart_path, alert: "ไม่พบสินค้านี้ในตะกร้า" and return
    end
  end

  def quantity_params
    params.require(:cart_item).permit(:quantity)
  end
end
