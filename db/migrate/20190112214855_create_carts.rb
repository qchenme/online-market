class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total_value, null: false
      t.boolean :is_completed, null: false

      t.timestamps
    end
  end
end
