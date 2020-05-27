class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  VALID_TELEPHONE_NUMBER_REGEX =             /\A[0-9０-９]+\z/
  
  validates :post_code,                          presence: true, numericality: { only_integer: true }
  validates :prefecture_id, :city, :block,       presence: true
  validates :telephone_number,                   allow_blank: true, numericality: {only_integer: true}
end
