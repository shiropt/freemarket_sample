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
  
  validates :price, :numericality => { :greater_than => 299 }
  validates :price, :numericality => { :less_than => 9999999  }

  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_day

  belongs_to :user, optional: true
  belongs_to :category
  has_one :purchased_info
  has_many :comments
  has_many :images
  accepts_nested_attributes_for :images
end