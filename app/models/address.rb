class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  VALID_NUMBER_REGEX =               [0-9]

  validates :post_code,                  presence: true, numericality: { only_integer: true }
  validates :prefecture_id,              presence: true
  validates :city,                       presence: true
  validates :block,                      presence: true
  validates :telephone_number,           numericality: { only_integer: true }, allow_nil: true
end
