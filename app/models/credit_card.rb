class CreditCard < ApplicationRecord
  belongs_to :user

  validates :customer_id,          presence: true
end
