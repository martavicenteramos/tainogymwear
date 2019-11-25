class AddMoreColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :cut

    add_column :users, :min_price, :integer

    add_column :users, :max_price, :integer
  end
end
