require 'rails_helper'

RSpec.describe CreditCard do
  
  describe '#create' do
    it "CreditCardモデル項目全て存在すれば登録できること" do
      creditcard = build(:creditCard)
      creditcard.valid?
      expect(creditcard).to be_valid
    end

    it "customer_idがない場合は登録できないこと" do
      user = build(:creditCard, customer_id: nil)
      user.valid?
      expect(user.errors[:customer_id]).to include("を入力してください")
    end
  end
end