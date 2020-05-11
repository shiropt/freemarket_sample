class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_one :address
  has_one :credit_card
  has_many :purchased_infos
  has_many :items
  has_many :comments

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :address

  before_save { self.email = email.downcase }           #emailを小文字に変換
  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =              /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i
  VALID_NAME_REGEX =                  /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA_REGEX =             /\A[ぁ-んー－]+\z/

  validates :email,                        presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password,                     presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation,        presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name,                    presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,                   presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,               presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana,              presence: true, format: { with: VALID_NAME_REGEX }
  validates :gender,                       presence: true
  validates :birth_day,                    presence: true

end
