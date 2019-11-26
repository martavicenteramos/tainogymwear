class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total_value
      t.date :date
      t.string :status
      t.text :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
