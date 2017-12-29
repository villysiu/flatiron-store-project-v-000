class StoreController < ApplicationController
  
  def index
    @items = Item.select {|item| item.inventory > 0}
  end
end
