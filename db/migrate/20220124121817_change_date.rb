class ChangeDate < ActiveRecord::Migration[7.0]
  def change
    change_column :authors, :dob, :text
  end
end
