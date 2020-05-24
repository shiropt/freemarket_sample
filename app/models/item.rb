class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, 
            :description, 
            :condition_id, 
            :price,
            :category_id,
            :condition_id,
            :shipping_day_id,
            :prefecture_id,
            :user_id,
            presence: true
  validates :shipping_fee_side, inclusion: {in: [true, false]}
  validates :images, presence: true
  
  validates :price, :numericality => { :greater_than_or_equal_to => 300 }
  validates :price, :numericality => { :less_than => 10000000 }

  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_day

  belongs_to :user, optional: true
  belongs_to :category
  has_one :purchased_info
  has_many :comments
  has_many :images, foreign_key: :item_id, dependent: :destroy
  accepts_nested_attributes_for :images

  def self.search(search)
    # searchの中身がなければ全てを取得する
    returen Item.all unless search
    Item.where("name LIKE(?)", "%#{search}%")
  end
end