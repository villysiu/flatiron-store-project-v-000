class ItemsController < ApplicationController
  def index

    @items = Item.select {|item| item.inventory > 0}
  #  @items = Item.all
  #  @line_item = current_cart.line_items.new
  end
  def show
    @item = Item.find(params[:id])
  end
end
