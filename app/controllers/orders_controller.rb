class OrdersController < ApplicationController

  before_action :correct_customer, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.where("customer_id = ?", current_customer).order("order_date DESC").paginate(page: params[:page], :per_page => 10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where("order_id = ?", @order.id)
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

    cart_items = CartItem.where("customer_id = ?", current_customer);
    @order.total = BigDecimal("0.00")
    cart_items.each do |cart_item|
      @order.total += Product.find(cart_item.product_id).price * BigDecimal(cart_item.quantity)
    end

    if @order.save
      # get all cart items for current_customer
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.order_id = @order.id
        order_item.product_id = cart_item.product_id
        order_item.quantity = cart_item.quantity
        cart_item.destroy
        order_item.save
      end
      flash[:success] = "Order #{@order.id} successfully created!"
      redirect_to orders_path
    else
      render 'new'
    end

  end



  private

    def order_params
      params.require(:order).permit(:name, :ship_to_address, :payment_type)
    end

    # Before filters

    def correct_customer
      order = Order.find(params[:id])
      customer = Customer.find(order.customer_id)
      if (!current_customer?(customer))
        flash[:notice] = "Nice try!"
        redirect_to orders_path
      end
    end

end
