class CartsController < ApplicationController
    before_action :require_login

  def show
      @cart = Cart.find(params[:id])
  #    @line_items = LineItem.select{|li| li["cart_id"] = cart.id }
  #    @line_items = @cart.line_items
  end

  def checkout
    #order = Order.create(current_cart)
    @cart = Cart.find(params[:id])
    @cart.status = "submitted"
    @cart.line_items.each do |line_item|
      puts line_item.quantity
      line_item.item.inventory -= line_item.quantity
      line_item.save
    end
    current_user.current_cart = nil
    @cart.save
    current_user.save
    redirect_to cart_path(@cart), notice: "thank you"
  end
end
