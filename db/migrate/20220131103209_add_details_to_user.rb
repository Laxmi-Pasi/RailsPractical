class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :create_date, :string
    add_column :users, :update_date, :string
    add_column :users, :password, :string
    add_column :users, :phone, :integer
  end
end
