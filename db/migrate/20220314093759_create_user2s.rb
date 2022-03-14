class CreateUser2s < ActiveRecord::Migration[7.0]
  #this user model is JavaScript with rails practical
  def change
    create_table :user2s do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :subcription
      t.string :subscription_email

      t.timestamps
    end
  end
end
