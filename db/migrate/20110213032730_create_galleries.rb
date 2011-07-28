class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name
      t.timestamps
      t.integer :visibility
    end
  end

  def self.down
    drop_table :galleries
  end
end
