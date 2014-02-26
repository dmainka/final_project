class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page])
  end

  def show
    product_id = params["id"]
    @product = Product.find_by :id => product_id
  end
end
