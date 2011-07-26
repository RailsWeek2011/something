class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :author_id
      t.boolean :archived, :default => false
      t.references :comment

      t.timestamps
    end
    add_index :posts, :comment_id
  end
end
