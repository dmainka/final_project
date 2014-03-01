class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :date
      t.float :total

      t.timestamps
    end
  end
end
