class RemoveTotalValueFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :total_value
  end
end
