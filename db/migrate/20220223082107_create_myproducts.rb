class CreateMyproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :myproducts do |t|
      t.string :name
      t.float :price
      t.string :description

      t.timestamps
    end
  end
end
