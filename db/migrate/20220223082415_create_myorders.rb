class CreateMyorders < ActiveRecord::Migration[7.0]
  def change
    create_table :myorders do |t|
      t.integer :quantity
      t.float :total_price
      t.integer :myproduct_id

      t.timestamps
    end
  end
end
