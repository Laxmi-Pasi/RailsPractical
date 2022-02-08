class AddColDobToStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :DOB, :date
  end
end
