class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:equipment, :affiliation)
    @categories = Category.all.includes(:equipment => :items)
  end

  def new
  end
end
