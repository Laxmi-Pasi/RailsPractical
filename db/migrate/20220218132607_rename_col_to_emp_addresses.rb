class RenameColToEmpAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :emp_addresses, :employee_id, :form_helper_employee_id 
  end
end
