FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/public/material/pict/pict-reason-01.jpg")}
    association :item
  end
end