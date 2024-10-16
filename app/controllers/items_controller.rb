class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:equipment, :affiliation)
    @categories = Category.includes(:equipment).all
  end
end
