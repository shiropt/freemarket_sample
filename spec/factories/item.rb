FactoryBot.define do

  factory :item do
    user_id {1}
    name {"マスク"}
    description {"商品説明"}
    price {400}
    size_id {1}
    category_id {1}
    condition_id {1}
    shipping_fee_side {0}
    prefectures_id {1}
    shipping_days_id {1}
  end

  factory :image do
    image {File.open("#{Rails.root}/public/material/pict/pict-reason-01.jpg")}
    association :item
  end

end
