require 'rails_helper'
describe Profile do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:profile, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  end
end
