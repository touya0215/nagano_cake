class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def add_tax_price
      #税率１０％で統一
    (self.price * 1.10).round
  end
  
  def sum_of_price
    item.texin_price * amount
  end
  
end
