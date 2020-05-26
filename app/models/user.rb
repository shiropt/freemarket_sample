class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :credit_card
  has_many :purchased_infos
  has_many :items
  has_many :comments

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :address

  before_save { self.email = email.downcase }           #emailを小文字に変換
  VALID_PASSWORD_REGEX =              /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i
  VALID_NAME_REGEX =                  /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAME_KANA_REGEX =             /\A[ぁ-んー－]+\z/

  validates :password, :password_confirmation,       allow_blank: true, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, :first_name,                 presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana, :first_name_kana,       presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birth_day,                              presence: true


end
