class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:equipment, :affiliation)
  end
end
