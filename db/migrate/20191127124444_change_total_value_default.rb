class ChangeTotalValueDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :total_value, 0
  end
end
