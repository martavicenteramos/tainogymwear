class AddTotalValueToOrders < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :total_value, currency: { present: false }
  end
end
