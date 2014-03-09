class AddCustomerIdToCartItems < ActiveRecord::Migration

  def self.up
    add_column :cart_items, :customer_id, :integer
  end

  def self.down
    remove_column :cart_items, :customer_id
  end

end
