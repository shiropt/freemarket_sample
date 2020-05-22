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

    it 'prefectures_idがない場合は登録できないこと' do
      item = build(:item, prefectures_id: nil)
      item.valid?
      expect(item.errors[:prefectures_id]).to include("を入力してください")
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

  end
end
