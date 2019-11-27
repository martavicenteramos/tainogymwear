class OrderProductsController < ApplicationController
  before_action :set_product, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @order_product = OrderProduct.new(order_product_params)
    @order_product.product = @product
    @order_product.quantity = 1
    authorize @order_product
    if @order_product.save
      redirect_to product_path(@product), alert: "Sucessfully added this item to your cart"
    else
      render 'products/show'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :quantity, :size, :order_id)
  end
end
