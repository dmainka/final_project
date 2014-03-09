class CartItem < ActiveRecord::Base

  belongs_to :customer#, :dependent => destroy
  belongs_to :product#, :dependent => destroy    #strictly not necessary as I have a check in the product destory

end
