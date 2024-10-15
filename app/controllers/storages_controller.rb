class StoragesController < ApplicationController
  def index
    @storages = Storage.all
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(storage_params)
    if @storage.save
      redirect_to storages_path, notice: 'Storage was successfully created.'
    else
      @storages = Storage.all # Fetch all storages for the index view
      render :index, status: :unprocessable_entity
    end
  end


  def show
    @storage = Storage.find(params[:id])
  end
  
  def edit
    @storage = Storage.find(params[:id])
  end


  private


  def storage_params
    params.require(:storage).permit(:storage)
  end
end
