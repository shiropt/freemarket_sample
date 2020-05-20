FactoryBot.define do

  factory :item do
    
    user_id {1}
    name {"マスク"}
    description {"商品説明"}
    price {500}
    size_id {1}
    brand {"謎"}
    category_id {10}
    condition_id {1}
    shipping_fee_side {1}
    prefectures_id {1}
    shipping_days_id {1}

    association :category
  end

end
