class Product < ActiveRecord::Base

  belongs_to :vendor
  belongs_to :department
  has_many :cart_items

  before_destroy :ensure_not_referenced_by_any_cart_item

  #ensure that there are no cart_items referencing this product
  def ensure_not_referenced_by_any_cart_item
    if cart_items.count.zero?
      return true
    else
      errors.add(:base, 'Cart Items present')
      return false
    end

end
