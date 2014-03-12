class Book < ActiveRecord::Base

  belongs_to :product, :dependent => :destroy

end
