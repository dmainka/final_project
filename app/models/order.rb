class Order < ActiveRecord::Base

  belongs_to :customer
  has_many :order_items, :dependent => :destroy
  has_many :products, :through => :order_items

  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :order_date, :name, :ship_to_address, :payment_type, :presence => true
  validates :payment_type, :inclusion => PAYMENT_TYPES

end
