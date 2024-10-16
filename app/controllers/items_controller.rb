class ItemsController < ApplicationController
  def index
    @categories = Category.all.includes(:equipment => :items, :items => :affiliation)
    @categories_for_list = Category.all
  end

  def category_items
    @category = Category.find(params[:category_id])
    @equipment = @category.equipment.includes(:items => :affiliation)
  end
end
