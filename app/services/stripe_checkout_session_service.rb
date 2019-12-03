class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    if order
      order.update(status: 'paid')
    end
  end
end
