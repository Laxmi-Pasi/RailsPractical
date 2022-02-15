class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.float :total_price
      t.integer :product_id
      t.integer :customer_id
      t.integer :status

      t.timestamps
    end
  end
end
