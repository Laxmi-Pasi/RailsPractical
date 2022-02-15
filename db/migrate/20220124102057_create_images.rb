class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :img_name
      t.integer :author_id
      t.integer :book_id

      t.timestamps
    end
  end
end
