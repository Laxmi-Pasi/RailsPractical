class AddColToEmpAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :emp_addresses, :employee_id, :integer
  end
end
