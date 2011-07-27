class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.boolean :visibility
      t.references :album
      t.string :picture
      t.timestamps
    end
    add_index :images, :album_id
  end
end
