class AddColToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :status, :integer
  end
end
