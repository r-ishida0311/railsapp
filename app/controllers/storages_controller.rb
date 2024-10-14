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
    render :new, status: :unprocessable_entity
  end
end

def show
  @storage = Storage.find(params[:id])
end

def edit
  @storage = Storage.find(params[:id])
end

def update
  @storage = Storage.find(params[:id])

  if @storage.update(storage_params)
    redirect_to storages_path, notice: 'Storage was successfully updated.'
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @storage = Storage.find(params[:id])
  @storage.destroy

  redirect_to storages_path, notice: 'Storage was successfully destroyed.'
end

private

def storage_params
  params.permit(:storage)
end

  # ... other actions ...
end
