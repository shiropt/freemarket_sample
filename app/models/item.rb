class Item < ApplicationRecord
  validates :name, :condition,:description,:shipping_fee_side,:price, presence: true
  
  belongs_to :user
  # belongs_to_active_hash :prefecture
  belongs_to :brand
  belongs_to :category
  has_one :purchased_info
  has_many :images
  has_many :comments

end

      
