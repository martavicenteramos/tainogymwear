class PaymentsController < ApplicationController
  before_action :skip_pundit?
  skip_after_action :verify_authorized

  def new
    @order = current_user.orders.where(status: 'pending').find(params[:order_id])
  end
end
