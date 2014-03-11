class ChangeFormatInOrders < ActiveRecord::Migration

  def self.up
   change_column :orders, :total, :decimal, :precision => 8, :scale => 2
  end

  def self.down
   change_column :orders, :total, :float
  end

end
