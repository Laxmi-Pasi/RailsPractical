class ChangeDefaultValueFromMyusers < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:myusers, :role, nil)
  end
end
