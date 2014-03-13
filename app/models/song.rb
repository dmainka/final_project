class Song < ActiveRecord::Base

  belongs_to :product, :dependent => :destroy

end
