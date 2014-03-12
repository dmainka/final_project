class CartItemsController < ApplicationController

  before_action :correct_customer, only: [:edit, :update, :destroy, :show]

  def index
    @cart_items = CartItem.where("customer_id = ?", current_customer).paginate(page: params[:page], :per_page => 10)
    render 'index_table'
  end

  def show
    cart_item = CartItem.find(params[:id])
    render cart_item
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

    redirect_to(cart_items_path, :notice => "Item was successfully added to your cart.")
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    CartItem.find(params[:id]).destroy
    redirect_to(cart_items_path, :notice => "Item was successfully deleted from your cart.")
  end

  def edit
    @cart_item = CartItem.find(params[:id])
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update_attributes(cart_params)
      flash[:success] = "Quantity updated"
      if (@cart_item.quantity <= 0)
        @cart_item.destroy
      end
      redirect_to cart_items_path
    else
      render 'edit'
    end

  end

  def empty_cart
    cart_items = CartItem.where("customer_id = ?", current_customer);

    cart_items.each do |cart_item|
      cart_item.destroy
    end

    redirect_to(cart_items_path, :notice => "Cart was successfully emptied.")
  end

  private

    def cart_params
      params.require(:cart_item).permit(:quantity)
    end

    # Before filters

    def correct_customer
      cart_item = CartItem.find(params[:id])
      customer = Customer.find(cart_item.customer_id)
      if (!current_customer?(customer))
        flash[:notice] = "Nice try!"
        redirect_to cart_items_path
      end
    end

end
