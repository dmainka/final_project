module CartItemsHelper

  def cart_count
    session[:cart_count] = CartItem.where("customer_id = ?", current_customer).sum(:quantity)
  end

  # def correct_customer(cart_item)
  #   customer = Customer.find(cart_item.customer_id)
  #   current_customer?(customer)
  # end

end
