# README


## usersテーブル
|Column            |Type    |Options                          |
|------------------|--------|---------------------------------|
|last_name         |string  |null: false                      |
|first_name        |string  |null: false                      |
|last_name_kana    |string  |null: false                      |
|first_name_kana   |string  |null: false                      |
|email             |string  |null: false, unique: true        |
|gender            |integer |null: false                      |
|birth_day         |date    |null: false                      |
|encypted_password |string  |null: false                      |

### Association
- has_one :credit_card
- has_one :profile
- has_one :address
- has_many :purchased_infos
- has_many :items
- has_many :comments
  


## addressテーブル
|Column          |Type    |Options                            |
|----------------|--------|-----------------------------------|
|post_code       |integer |null: false                        |
|prefectures_id  |integer |null: false                        |
|city            |string  |null: false                        |
|block           |string  |null: false                        |
|building        |string  |                                   |
|telephone_number|string  |                                   |
|user_id         |integer |null: false, foreign_key: true     |# referenceに変更

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture
  


## profilesテーブル
|Column        |Type     |Options                            |
|--------------|---------|-----------------------------------|
|user_id       |integer  |null: false, foreign_key: true     |# referenceに変更
|nickname      |string   |null: false                        |
|image         |string   |                                   |
|profile       |text     |                                   |

### Association
- belongs_to :user



### credit_cardsテーブル
|Column       |Type  |Options                       |
|-------------|------|------------------------------|
|user_id      |intger|null: false, foreign_key: true|# referenceに変更
|customer_id  |string|null: false                   |
|card_id      |string|null: false                   |

### Association
- belongs_to :user



### commentsテーブル
|Column|Type|Options|
|-------|------|------------------------------|
|user_id|intger|null: false, foreign_key: true|# referenceに変更
|item_id|intger|null: false, foreign_key: true|# referenceに変更 # foreign_key追加
|comment|text  |null: false                   |

### Association
- belongs_to :user
- belongs_to :item



### imagesテーブル
|Column |Type   |Options                        |
|-------|-------|-------------------------------|
|image  |string |null: false                    |
|item_id|integer|null: false, foreign_key: true |# reference ok

### Association
- belongs_to :item



### categoriesテーブル
|Column  |Type  |Options    |
|--------|------|-----------|
|name    |string|null: false|
|ancestry|string|           |

### Association
- has_many :items
- has_ancestry



### purchased_infosテーブル
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|user_id      |integer   |null: false, foreign_key: true|# reference ok
|item_id      |integer   |null: false, foreign_key: true|# reference ok
|purchase_date|date      |null: false                   |
|shipping_fee |integer   |null: false                   |#追記

### Association
- belongs_to :item
- belongs_to :user



### itemsテーブル
|Column           |Type     |Options                       |
|-----------------|---------|------------------------------|
|name             |string   |null: false                   |
|description      |text     |null: false                   |
|price            |integer  |null: false                   |
|size_id          |integer  |                              |@
|category_id      |integer  |null: false                   |
|brand            |string   |                              |#変更
|condition_id     |integer  |null: false                   |#変更 @
|shipping_fee_side|boolean  |null: false                   |
|prefectures_id   |integer  |null: false                   |@
|shipping_days_id |integer  |                              |@
|user_id          |integer  |null: false                   |# reference追加
|purchased_info_id|integer  |             foreign_key: true|#追記、# reference 追加

### Association  
- belongs_to :user                       # belongs_to :brand消去
- belongs_to :category
- has_one :purchased_info             # has_oneに変更
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :size
- belongs_to_active_hash :condition    #追記
- belongs_to_active_hash :shipping_day
- has_many :images
- has_many :comments

