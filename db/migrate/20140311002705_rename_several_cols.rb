class RenameSeveralCols < ActiveRecord::Migration
  def change
    rename_column :order_items, :customer_id, :order_id
    rename_column :orders, :date, :order_date
  end
end
