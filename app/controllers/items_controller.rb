class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:equipment, :affiliation)
    @categories = Category.all.includes(:equipment => :items)
  end

  def new
    @reservation = Reservation.new(item_id: params[:item_id]) # Get item_id from params
    # ... other logic ...
  end
end
