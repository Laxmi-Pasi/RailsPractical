class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.string :designation
      t.datetime :DOB
      t.string :email_id
      t.integer :phone

      t.timestamps
    end
  end
end
