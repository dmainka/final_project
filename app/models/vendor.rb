class Vendor < ActiveRecord::Base

  has_many :products

  validates :rating, :inclusion => 1..5

end
