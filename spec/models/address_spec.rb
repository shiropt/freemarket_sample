require 'rails_helper'
describe Address do
  describe '#create' do
    it "addressモデル項目全て存在すれば登録できること" do
      user = build(:address)
      user.valid?
      expect(user).to be_valid
    end

    it "post_codeがない場合は登録できないこと" do
      user = build(:address, post_code: nil)
      user.valid?
      expect(user.errors[:post_code]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = build(:address, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("can't be blank")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:address, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "blockがない場合は登録できないこと" do
      user = build(:address, block: nil)
      user.valid?
      expect(user.errors[:block]).to include("can't be blank")
    end

    it "buildingが無くても登録できること" do
      user = build(:address, building: nil)
      user.valid?
      expect(user).to be_valid
    end

    it "telephone_numberが英数以外の場合は登録できないこと" do
      user = build(:address, telephone_number: "hogeほげ009")
      user.valid?
      expect(user).to_not match([0 - 9])
    end

    it "telephone_numberが無くても登録できること" do
      user = build(:address, telephone_number: nil)
      user.valid?
      expect(user).to be_valid
    end

  end
end
