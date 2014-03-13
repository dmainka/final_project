class VendorRatings < ActiveRecord::Migration

  def self.up
    add_column :vendors, :rating, :integer
  end

  def self.down
    remove_column :vendors, :rating, :integer
  end

end
