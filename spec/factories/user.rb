FactoryBot.define do

  factory :user do
    email {"hoge@hoge.jp"}
    password {"abcd1234"}
    password_confirmation {"abcd1234"}
    last_name {"ほげ"}
    first_name {"太郎"}
    last_name_kana {"ほげ"}
    first_name_kana {"たろう"}
    gender {"1"}
    birth_day {"1989-01-01"}
  end

  factory :profile do
    nickname {"hoge"}
  end

  factory :address do
    post_code {"1234567"}
    prefecture_id {"1"}
    city {"旭川"}
    block {"1-1-1"}
    building {"hogeハイツ101"}
    telephone_number {"09012345678"}
  end

end
