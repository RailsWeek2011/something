class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.boolean :visibility

      t.timestamps
    end
  end
end
