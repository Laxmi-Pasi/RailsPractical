class ChangeColFromProduct < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :status, :text
  end
end
