require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    context '登録可能テスト' do
      it 'sizeなしで登録出来ること' do
        expect(build(:item, size: nil)).to be_valid
      end
      
      it 'brandなしで登録出来ること' do
        expect(build(:item, brand: nil)).to be_valid
      end

    end

    context '登録不可テスト' do
      it 'user_idがない場合は登録できないこと' do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user_id]).to include("を入力してください")
      end

      it 'category_idがない場合は登録できないこと' do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      
      it 'nameがない場合は登録できないこと' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end
      
      it 'priceがない場合は登録できないこと' do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'descriptionがない場合は登録できないこと' do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("を入力してください")
      end

      it 'prefectures_idがない場合は登録できないこと' do
        item = build(:item, prefectures_id: nil)
        item.valid?
        expect(item.errors[:prefectures_id]).to include("を入力してください")
      end

      it 'shipping_fee_sideがない場合は登録できないこと' do
        item = build(:item, shipping_fee_side: nil)
        item.valid?
        expect(item.errors[:shipping_fee_side]).to include("を入力してください")
      end

      it 'condition_idがない場合は登録できないこと' do
        item = build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください")
      end

      it 'shipping_days_idがない場合は登録できないこと' do
        item = build(:item, shipping_days_id: nil)
        item.valid?
        expect(item.errors[:shipping_days_id]).to include("を入力してください")
      end

      it "priceが300未満の場合は登録出来ないこと" do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("300以上で入力してください")
      end

      it "priceが10000000以上の場合は登録出来ないこと" do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("10000000未満で入力してください")
      end

      it "画像がない場合は登録できないこと" do
        item = build(:item)
        item.item_images = []
        item.valid?
        expect(item.errors[:images]).to include("can't be blank")
      end
  
    end
  end
end
