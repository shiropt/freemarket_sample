require 'rails_helper'
describe User do
  describe '#create' do
    it "userモデル項目全て存在すれば登録できること" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが無いと登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが７文字以下の時は登録できないこと" do
      user = build(:user, password: "abcd12")
      user.valid?
      expect(user.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it "passwordが英字と英数字を含まない時は登録できないこと" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it "passwordが英字と英数字を含まない時は登録できないこと" do
      user = build(:user, password: "1111111")
      user.valid?
      expect(user.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it "password_confirmationが無いと登録できないこと" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "last_nameが全角ひらカナ漢字以外を含む時は登録できないこと" do
      user = build(:user, last_name: "hoge壱")
      user.valid?
      expect(user.errors[:last_name]).to_not match(/\A[ぁ-んァ-ン一-龥]/)
    end

    it "first_nameが全角ひらカナ漢字以外を含む時は登録できないこと" do
      user = build(:user, first_name: "ほげ1")
      user.valid?
      expect(user.errors[:first_name]).to_not match(/\A[ぁ-んァ-ン一-龥]/)
    end

    it "last_name_kanaが全角ひらがな以外を含む時は登録できないこと" do
      user = build(:user, last_name_kana: "hoge壱")
      user.valid?
      expect(user.errors[:last_name_kana]).to_not match(/\A[ぁ-んー－]+\z/)
    end

    it "first_name_kanaが全角ひらがな以外を含む時は登録できないこと" do
      user = build(:user, first_name_kana: "ホゲ1")
      user.valid?
      expect(user.errors[:first_name_kana]).to_not match(/\A[ぁ-んー－]+\z/)
    end

    it "genderが無いと登録できないこと" do
      user = build(:user, gender: nil)
      user.valid?
      expect(user.errors[:gender]).to include("can't be blank")
    end

    it "birth_dayが無いと登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
  end
end