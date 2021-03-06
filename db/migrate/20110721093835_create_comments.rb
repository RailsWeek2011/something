class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.integer :author_id
      t.text :content

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
