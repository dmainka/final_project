class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :vendor_id
      t.string :name
      t.text :description
      t.float :price
      t.string :picture_url

      t.timestamps
    end
  end
end
