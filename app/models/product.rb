class Product < ActiveRecord::Base

  belongs_to :vendor
  belongs_to :department

end
