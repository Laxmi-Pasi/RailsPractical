class AddColPasswordConfirmationToUser2 < ActiveRecord::Migration[7.0]
  def change
    add_column :user2s, :password_confirmation, :string
  end
end
