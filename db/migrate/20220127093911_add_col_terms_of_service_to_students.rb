class AddColTermsOfServiceToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :terms_of_service, :boolean
  end
end
