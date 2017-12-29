class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :line_items, through: :cart
  has_one :current_cart, class_name: 'Cart'




 def orders
   self.carts.where("status = 'submitted'")
  end

end
