class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.integer :rating
      t.boolean :favorite, null: false, default: false
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
