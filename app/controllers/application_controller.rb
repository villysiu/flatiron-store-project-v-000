class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to store_path # halts request cycle
    end
  end

  def current_cart

    if current_user.current_cart.nil?

      cart = Cart.create
      cart.user = current_user
      cart.save
      current_user.current_cart = cart
      current_user.save
    end
    current_user.current_cart
  end
end


#rake db:migrate RAILS_ENV=development
