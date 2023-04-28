class Item < ApplicationRecord
  belongs_to :genre
  #validates :is_active, inclusion: { in: [true, false] }
end
