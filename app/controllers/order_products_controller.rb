class OrderProductsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_order_product, only: [:destroy]
  # skip_before_action :authenticate_user!, only: [:create]
  # after_action :check_quantity, only: [:remove]

  def create
    @wishlist = Wishlist.new
    authorize @wishlist
    if current_user.nil?
      redirect_to new_user_session_path, alert: "You need to be signes in first"
    else
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
        respond_to do |format|
          format.js { sleep 1.5 }
          format.html {
            redirect_to product_path(@product), alert: "Sucessfully added this item to your cart"
          }
        end
      else
        respond_to do |format|
          format.js
          format.html { render 'products/show' }
        end
      end
    end
  end

  def add
    @order_product = OrderProduct.find(params[:id])
    authorize @order_product
    @order_product.quantity += 1
    @order_product.order.total_value += @order_product.product.price
    @order_product.save
    @order_product.order.save
  end

  def remove
    @order_product = OrderProduct.find(params[:id])
    authorize @order_product
    if @order_product.quantity == 1
      @order_product.order.total_value -= @order_product.product.price
      @order_product.order.save
      @order_product.destroy
    else
      @order_product.quantity -= 1
      @order_product.order.total_value -= @order_product.product.price
      @order_product.save
      @order_product.order.save
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

  def check_quantity(order_product)
    if order_product.quantity.zero?
      order_product.destroy
    end
  end

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
