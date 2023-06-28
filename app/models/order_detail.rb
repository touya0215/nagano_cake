class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def sum_total
    shipping_cost + total_payment
  end
  
  def sum_of_price
    item.texin_price * amount
  end

end
