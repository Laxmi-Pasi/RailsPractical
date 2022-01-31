class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.float :price
      t.string :user_id

      t.timestamps
    end
  end
end
