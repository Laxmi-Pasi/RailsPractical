class ChangColDobToStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :DOB, :DateTime
end
