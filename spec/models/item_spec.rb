require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    it 'user_idがない場合は登録できないこと' do
      item = FactoryBot.build(:item, user_id: nil)
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

    it 'prefecture_idがない場合は登録できないこと' do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it 'condition_idがない場合は登録できないこと' do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it 'shipping_day_idがない場合は登録できないこと' do
      item = build(:item, shipping_day_id: nil)
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("を入力してください")
    end

  end

  # 検索機能単体テスト
  # describe "#search" do
  #   before do 
  #     @item = build(:item)
  #   end
  #   context "search by 'マスク'" do
  #     it "returns @item" do
  #       expect(Item.search("マスク")).to include(@item)
  #     end
  #   end
  # end



end
