class CreateUserProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_product_types do |t|
      t.references :product_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
