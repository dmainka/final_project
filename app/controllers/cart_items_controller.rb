class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where("customer_id = ?", current_customer);
  end

  def show
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @cart_items = @cart.cart_items.build(:product => product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart, :notice => 'Line item was successfully created.') }
          format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" } format.xml { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

end
