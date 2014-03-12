class ProductsController < ApplicationController

  def index
    @products = Product.paginate(page: params[:page], :per_page => 10)
  end

  def show
    product_id = params["id"]
    @product = Product.find(product_id)
    department = Department.find_by(@product.department_id)
    case department.name
      when "Books"
        flash[:success] = "Found your book"
        book = Book.find_by(:product_id => product_id)
        redirect_to book_path(book.id)
      when "Music1"
        flash[:success] = "Found your music"
        @music = Music.find_by :id => product_id
        render @music
      else
        flash[:notice] = "Only found a generic product"
    end
  end

end
