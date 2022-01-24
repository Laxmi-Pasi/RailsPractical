class ChangeDate1 < ActiveRecord::Migration[7.0]
  def change
    change_column :authors, :dob, :strftime
  end
end
