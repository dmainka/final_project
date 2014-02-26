class CustomersController < ApplicationController

  before_action :signed_in_customer, only: [:edit, :update]
  before_action :correct_customer,   only: [:show, :edit, :update]
  before_action :admin_user,         only: :destroy

  def index
    @customers = Customer.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      sign_in @customer
      flash[:success] = "Welcome to Nile.com!"
      redirect_to @customer
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @customer.update_attributes(customer_params)
      flash[:success] = "Profile updated"
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted."
    redirect_to customers_url
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def signed_in_customer
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(root_url) unless current_customer?(@customer)
    end

  def admin_user
      redirect_to(root_url) unless current_customer.admin?
    end
end
