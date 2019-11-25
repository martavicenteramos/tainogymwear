class CreateUserColours < ActiveRecord::Migration[5.2]
  def change
    create_table :user_colours do |t|
      t.references :colour, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
