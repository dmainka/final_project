class BooksController < ApplicationController

  def index
    department_id = Department.find_by(:name => 'Books')
    @books = Product.where("department_id = ?", department_id).paginate(page: params[:page], :per_page => 10)
  end

  def show
    @book = Book.find(params[:id])
    @product = Product.find(@book.product_id)
  end

end
