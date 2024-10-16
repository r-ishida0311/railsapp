class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:equipment, :affiliation)
    @categories = Category.all
  end
end
