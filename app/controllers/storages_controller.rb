class StoragesController < ApplicationController
  def index
    @search = Storage.ransack(params[:q])
    @search.sorts = 'id' if @search.sorts.empty?
    @storages = @search.result.page(params[:page])
    @storage = Storage.new
    @shelf = Shelf.new
  end

  def create
    @storage = Storage.new(storage_params)
    if @storage.save
      redirect_to storages_path
    else
      @search = Storage.ransack(params[:q])
      @search.sorts = 'id desc' if @search.sorts.empty?
      @storages = @search.result.page(params[:page])
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @storage = Storage.find(params[:id])
  end

  def edit
    @storage = Storage.find(params[:id])
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("storage_#{@storage.id}", partial: "storages/form", locals: { storage: @storage })
      end
    end
  end
  
  def update
    @storage = Storage.find(params[:id])
    if @storage.update(storage_params)
      redirect_to storages_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

def destroy
  @storage = Storage.find(params[:id])
  @storage.destroy
  respond_to do |format|
    format.html { redirect_to storages_path, notice: 'Storage was successfully destroyed.' }
    format.turbo_stream { render turbo_stream: turbo_stream.remove("storage_#{@storage.id}") }
  end
end

  private

  def storage_params
    params.require(:storage).permit(:storage)
  end
end