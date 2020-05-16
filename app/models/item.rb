class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, 
            :description, 
            :condition_id, 
            :price,
            :category_id,
            :condition_id,
            :shipping_fee_side, 
            :shipping_days_id,
            :prefectures_id,
            :user_id,
            presence: true

  validates :images, presence: true
  # validates :price, numericality: 
  #           { only_integer: true,
  #             greater_than_or_equal_to: 300,
  #             less_than: 10000000}
  # validates :condition_id, numericality: 
  #            { only_integer: true,
  #              greater_than_or_equal_to: 1,
  #              less_than: 7}
  # validates :prefectures_id, numericality: 
  #            { only_integer: true,
  #              greater_than_or_equal_to: 1,
  #              less_than: 48}
  # validates :shipping_days_id, numericality: 
  #            { only_integer: true,    
  #              greater_than_or_equal_to: 1,
  #              less_than: 4}
  # validates :size_id, numericality: 
  #            { only_integer: true,
  #              greater_than_or_equal_to: 1,
  #              less_than: 11}


  

  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_day
  
  belongs_to :user, optional: true
  belongs_to :category
  has_one :purchased_info
  has_many :comments
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :images, allow_destroy: true

end