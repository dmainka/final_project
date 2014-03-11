class ProductsController < ApplicationController

  def index
    @products = Product.paginate(page: params[:page], :per_page => 10)
  end

  def show
    product_id = params["id"]
    @product = Product.find_by :id => product_id
    # department = Department.find_by(id: product_id)
    # case department.name
    #   when :Books
        # @book = Book.find_by :id => product_id
        # @book = Book.find_by :id => product_id
        # redirect_to '/books/#{product_id}'
    #   when :Music

    #   else

    # end
  end

end
