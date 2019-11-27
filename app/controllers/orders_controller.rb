class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).where(user_id: current_user.id).where(status: "pending")
  end

  def cart
    @order = current_user.find_or_create_pending_order
    authorize @order
  end
end
