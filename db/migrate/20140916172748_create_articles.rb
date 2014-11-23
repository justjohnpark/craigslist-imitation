class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :price_in_dollars
      t.string :owner_email
      t.text :description
      t.string :link_to_image
      t.string :editor_key
      t.integer :category_id

      t.timestamps
    end
  end
end
