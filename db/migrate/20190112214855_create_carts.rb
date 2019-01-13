class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total_value
      t.boolean :is_completed
      
      t.timestamps
    end
  end
end
