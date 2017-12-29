class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def add_item(id)

    line_item = LineItem.find_by(item_id: id)
    if line_item
      line_item.quantity += 1
    else
      line_item = LineItem.new(item_id: id, quantity: 1, cart_id: self.id)
    end
  #  line_item.save
    line_item
  end

  def total
    line_items.collect {|li| li.valid? ? (li.item.price * li.quantity) : 0 }.sum
  end

end
