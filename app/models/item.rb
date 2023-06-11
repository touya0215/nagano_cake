class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_many :orders

  has_one_attached :image

  def add_tax_price
      #税率１０％で統一
    (self.price * 1.10).round
  end

  def texin_price
    price*1.1
  end

end
