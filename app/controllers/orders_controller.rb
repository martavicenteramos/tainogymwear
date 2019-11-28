class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).where(user_id: current_user.id).where(status: "pending")
  end

  def cart
    @order = current_user.find_or_create_pending_order
    @order_id = @order.id
    authorize @order
  end

  def checkout
    order = Order.find(params[:order].to_i)
    authorize order
    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: "hello",
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
end
