class AddDetailsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :title, :string
    add_column :products, :description, :string
    add_column :products, :capacity, :float
    add_column :products, :is_active, :boolean
    add_column :products, :status, :integer
  end
end
