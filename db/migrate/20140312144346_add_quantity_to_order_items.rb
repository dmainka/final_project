class AddQuantityToOrderItems < ActiveRecord::Migration

  def self.up
    add_column :order_items, :quantity, :integer
  end

  def self.down
    remove_column :order_items, :quantity, :integer
  end

end
