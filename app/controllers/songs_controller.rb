class SongsController < ApplicationController

  def index
    department_id = Department.find_by(:name => 'Songs')
    @songs = Product.where("department_id = ?", department_id).paginate(page: params[:page], :per_page => 10)
  end

  def show
    @song = Song.find(params[:id])
    @product = Product.find(@song.product_id)
  end

end
