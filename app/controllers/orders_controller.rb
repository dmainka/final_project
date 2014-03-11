include SessionsHelper

class OrdersController < ApplicationController

  def index
    @orders = Order.where("customer_id = ?", current_customer).paginate(page: params[:page], :per_page => 10)
  end

  def show

  end

  def new
    #normally not strictly necessary as Checkout button wouldn't be on screen if no items
    #but trying to ensure we don't get here some other way
    cart_items = CartItem.where("customer_id = ?", current_customer);
    if cart_items.count == 0
      redirect_to products_path, :notice => "Your cart is empty."
      return
    end

    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.order_date = Time.zone.now
    if @order.save
      # get all cart items for current_customer
      cart_items = CartItem.where("customer_id = ?", current_customer);
      order_total = 0
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.order_id = @order.id
        order_item.product_id = cart_item.product_id
        order_total += cart_item.quantity * Product.find_by(cart_item.product_id).price
        cart_item.destroy
        order_item.save
      end
      @order.total = order_total
      flash[:success] = "Order successfully created! for customer!"
      redirect_to products_path
    else
      render 'new'
    end

  end



  private

    def order_params
      params.require(:order).permit(:name, :ship_to_address, :payment_type)
    end

end
