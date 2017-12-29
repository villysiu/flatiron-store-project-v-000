class LineItemsController < ApplicationController
  before_action :current_cart, only: [:create, :destroy]
#  before_action :set_line_item, only: [:destroy]

  def create
  #  if current_user.current_cart.nil?
  #    current_user.current_cart = Cart.create
  #  end

    line_item = current_cart.add_item(line_item_params[:item_id])

    if line_item.save
      flash[:message] = "#{line_item.item.title} added into bag #{current_cart}"
      redirect_to cart_path(current_user.current_cart)
    else
      flash[:error] = "error in adding"
      redirect_to store_path
    end
  end

  def destroy
    item = current_cart.line_items.find(params[:id])
    item.destroy
    current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end

  private

    def line_item_params
      params.require(:line_item).permit(:item_id, :quantity, :cart_id)
    end
end
