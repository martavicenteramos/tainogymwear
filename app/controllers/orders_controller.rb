class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).where(user_id: current_user.id).where(status: "pending")
  end

  def cart
    @order = current_user.find_or_create_pending_order
    @order_id = @order.id
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    if @order.update(order_params)
      redirect_to order_review_information_path(@order)
    else
      render :edit
    end
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def review_information
    @order = Order.find(params[:order_id].to_i)
    authorize @order
  end

  def checkout
    order = Order.find(params[:order].to_i)
    authorize order
    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: "Your Taíno order!",
      amount: order.total_value_cents,
      currency: 'eur',
      quantity: 1
    }],
      success_url: products_url,
      cancel_url: products_url
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:address)
  end
end
