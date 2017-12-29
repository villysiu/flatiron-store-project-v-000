class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.select {|item| item.inventory > 0}
  #  @items = Item.select {|item| item.inventory > 0}
  end
end
