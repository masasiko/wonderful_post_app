class CreateTagArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_articles do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end

  end
# add_index :tag_articles, [:article_id, :tag_id], unique: true

end
