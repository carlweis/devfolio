class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :excerpt
      t.text :content_markdown
      t.text :content_html
      t.boolean :published
      t.timestamp :published_on

      t.timestamps null: false
    end
  end
end
