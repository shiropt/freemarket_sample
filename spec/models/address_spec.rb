require 'rails_helper'
describe Address do
  describe '#create' do
    it "post_codeがない場合は登録できないこと" do
      user = build(:address, post_code: nil)
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = build(:address, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:address, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "blockがない場合は登録できないこと" do
      user = build(:address, block: nil)
      user.valid?
      expect(user.errors[:block]).to include("を入力してください")
    end

    it "telephone_numberが英数以外の場合は登録できないこと" do
      user = build(:address, telephone_number: "hogeほげ009")
      user.valid?
      expect(user).to_not match(/\A[0-9０-９]+\z/)
    end

  end

end
