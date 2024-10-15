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

  def edit
    @storage = Storage.find(params[:storage_id])
    @shelf = @storage.shelves.find(params[:id])
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("shelf#{@shelf.id}", partial: "shelves/form", locals: { shelf: @shelf })
      end
    end
  end

  def update
    @storage = Storage.find(params[:storage_id])
    @shelf = @storage.shelves.find(params[:id])
    if @shelf.update(shelf_params)
      redirect_to storages_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    @storage = @shelf.storage # Get the associated storage
    @shelf.destroy
    respond_to do |format|
      format.html { redirect_to storages_path }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("shelf_#{@shelf.id}") }
    end
  end
  

  private

  def shelf_params
    params.require(:shelf).permit(:shelf)
  end
end
