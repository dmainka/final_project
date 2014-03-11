class AddColsToOrder < ActiveRecord::Migration

  def self.up
    add_column :orders, :name, :string
    add_column :orders, :ship_to_address, :text
    add_column :orders, :payment_type, :string
  end

  def self.down
    remove_column :orders, :name, :string
    remove_column :orders, :ship_to_address, :text
    remove_column :orders, :payment_type, :string
  end

end
