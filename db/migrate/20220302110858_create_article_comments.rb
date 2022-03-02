class CreateArticleComments < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comments do |t|
      t.string :comment
      t.date :date_of_comment
      t.integer :myarticle_id, null: true, foreign_key: true

      t.timestamps
    end
  end
end
