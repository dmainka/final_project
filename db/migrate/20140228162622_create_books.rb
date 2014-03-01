class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :product_id
      t.string :author
      t.integer :pages

      t.timestamps
    end
  end
end
