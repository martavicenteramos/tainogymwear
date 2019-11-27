class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).where(user_id: current_user.id)
  end
end
