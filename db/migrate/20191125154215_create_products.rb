class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :product_type, foreign_key: true
      t.references :colour, foreign_key: true
      t.references :cut, foreign_key: true
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
