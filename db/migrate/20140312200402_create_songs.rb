class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :product_id
      t.string :artist
      t.string :album
      t.integer :time

      t.timestamps
    end
  end
end
