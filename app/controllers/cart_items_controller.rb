class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where("customer_id = ?", current_customer);
    session[:cart_count] = CartItem.where("customer_id = ?", current_customer).sum(:quantity)
  end

  def show
  end

  def create
    # get all cart items for current_customer
    cart_items = CartItem.where("customer_id = ?", current_customer);

    current_item = cart_items.where(:product_id => params[:product_id]).first
    if (current_item)
      current_item.quantity += 1
      current_item.save
    else
      cart_item = CartItem.new
      cart_item.customer_id = current_customer.id
      cart_item.product_id = params[:product_id]
      cart_item.save
    end

    redirect_to(cart_items_path, :notice => "Cart item was successfully created.")

    # @cart_items = @cart.cart_items.build(:product => product)

    # respond_to do |format|
    #   if @cart_item.save
    #     format.html { redirect_to(@cart_item.cart, :notice => 'Cart item was successfully created.') }
    #     format.xml  { render :xml => @cart_item, :status => :created, :location => @cart_item }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml { render :xml => @cart_item.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

end
