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

private

def storage_params
  params.permit(:storage)
end

  # ... other actions ...
end
