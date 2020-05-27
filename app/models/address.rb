class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  VALID_TELEPHONE_NUMBER_REGEX =             /\A[0-9０-９]+\z/
  VALID_NAME_REGEX =                  /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAME_KANA_REGEX =             /\A[ぁ-んー－]+\z/

  validates :address_last_name, :address_first_name,                 presence: true, format: { with: VALID_NAME_REGEX }
  validates :address_last_name_kana, :address_first_name_kana,       presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :post_code,                          presence: true, numericality: { only_integer: true }
  validates :prefecture_id, :city, :block,       presence: true
  validates :telephone_number,                   allow_blank: true, numericality: {only_integer: true}
end
