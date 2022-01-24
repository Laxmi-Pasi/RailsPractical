class Addvalidation < ActiveRecord::Migration[7.0]
  def change
    change_column_null :authors, :first_name, false
    change_column_null :authors, :last_name, false
    change_column_null :authors, :dob, false
    change_column_null :authors, :email, false
  end
end
