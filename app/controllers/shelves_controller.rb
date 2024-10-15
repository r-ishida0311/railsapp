class ShelvesController < ApplicationController
  def new
    @storage = Storage.find(params[:storage_id])
    @shelf = Shelf.new
  end

  def create
    @storage = Storage.find(params[:storage_id])
    @shelf = @storage.shelves.build(shelf_params)
    if @shelf.save
      redirect_to storages_path
    else
      render :new
    end
  end

  private

  def shelf_params
    params.require(:shelf).permit(:shelf)
  end
end
