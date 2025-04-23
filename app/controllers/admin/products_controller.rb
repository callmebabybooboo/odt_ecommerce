class Admin::ProductsController < Admin::BaseController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "สร้างสินค้าเรียบร้อยแล้ว"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :description, :category, :base_price, :status, :stock, :cover_image,
      images: []
    )
  end
end
