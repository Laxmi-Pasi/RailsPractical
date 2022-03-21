class AddRefMyuserToMyproducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :myproducts, :myuser
  end
end
