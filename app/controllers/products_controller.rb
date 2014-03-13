class ProductsController < ApplicationController

  def index
    @products = Product.paginate(page: params[:page], :per_page => 10)
  end

  def show
    product_id = params["id"]
    @product = Product.find(product_id)
    department = Department.find(@product.department_id)
    case department.name
      when "Books"
        # flash[:success] = "Found your book"
        book = Book.find_by(:product_id => product_id)
        redirect_to book_path(book.id)
      when "Songs"
        # flash[:success] = "Found your song"
        song = Song.find_by(:product_id => product_id)
        redirect_to song_path(song.id)
      else
        flash[:notice] = "Only found a generic product #{department.name}"
    end
  end

end
