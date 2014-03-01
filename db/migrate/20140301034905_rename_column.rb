class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :cart_items, :customer_id, :cart_id
  end
end
