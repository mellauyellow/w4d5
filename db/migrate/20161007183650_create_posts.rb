class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content, null: false
      t.integer :sub_id, null: false
      t.integer :author_id, null: false
    end

    add_index :posts, :title
    add_index :posts, :sub_id
    add_index :posts, :author_id
  end
end