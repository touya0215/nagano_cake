class Item < ApplicationRecord
  belongs_to :genre
  
  has_one_attached :image
  
  def add_tax_price
      #税率１０％で統一
    (self.price * 1.10).round
  end
  
end
