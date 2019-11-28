class OrderProductsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_order_product, only: [:destroy]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @order = current_user.find_or_create_pending_order
    existing_order_products = OrderProduct.where(product_id: @product.id, order_id: @order.id, size: params[:order_product][:size])
    if existing_order_products.any?
      @order_product = existing_order_products.first
      @order_product.quantity += 1
      @order_product.order.total_value += @order_product.product.price
      @order_product.order.save
    else
      @order_product = OrderProduct.new(order_product_params)
      @order_product.product = @product
      @order_product.quantity = 1
      @order_product.order = @order
      @order_product.order.total_value += @order_product.product.price
      @order_product.order.save
    end
    authorize @order_product
    if @order_product.save
      redirect_to product_path(@product), alert: "Sucessfully added this item to your cart"
    else
      render 'products/show'
    end
  end

  def destroy
    @order = @order_product.order
    authorize @order_product
    @order.total_value -= @order_product.product.price * @order_product.quantity
    @order_product.order.save
    @order_product.destroy
    render 'orders/cart'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_product_params
    params.require(:order_product).permit(:quantity, :size)
  end

  def set_order_product
    @order_product = OrderProduct.find(params[:id])
  end
end
