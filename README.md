# README


## usersテーブル
|Column      |Type    |Options                                     |
|------------|--------|--------------------------------------------|
|name        |string  |null: false,                     |
|name_kana   |string  |null: false,                     |
|email       |string  |null: false, unique: true                 |
|gender      |integer |                   |
|birth_day   |date    |null: false,                  |
|password    |string  |null: false,               |


### Association
  belongs_to :credit_card
  belongs_to :profile
  belongs_to :address
  


## addressテーブル
|Column         |Type      |Options                                    |
|---------------|--------|-------------------------------------------|
|post_code      |integer |null: false                                           |
|city           |string  |null: false                                           |
|block          |string  |null: false                                           |
|building       |string  |null: false                                           |
|user_id        |integer |null: false, foreign_key: true             |
|prefectures_id |integer |null: false, foreign_key: true             |

### Association
  belongs_to :user
  belongs_to :prefecture
  



# prefecturesテーブル
|Column     |Type   |Options                                    |
|-----------|-------|-------------------------------------------|
|prefecture  |string|null: false,                   |

### Association
  has_many :address
  has_many :items

### profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|nickname|string|null: false|
|image|string||
|profile|text||

Association
belongs_to :user
has_many :purchased_infos
has_many :items
has_many :comments

### credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|intger|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

Association
belongs_to :user

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|intger|null: false, foreign_key: true|
|item_id|intger|null: false, foreign_key: true|
|comment|text|     |

Association
belongs_to :profile
belongs_to :item

### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

Association
belongs_to :item

### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|      |

Association
has_many :items
has_ancestry

### brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

Association
has_many :items

### purchased_infosテーブル
|Column|Type|Options|
|------|----|-------|
|profile_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|purchase_date|date|null: false|

Association
belongs_to :item
belongs_to :profile

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|size|integer|         |
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer| foreign_key: true|
|condition|string|null: false|
|shipping_fee|integer|null: false|
|shipping_fee_side|boolean|null: false|
|prefectures_id|integer|null: false, foreign_key: true|
|shipping_days|integer||

### Association
- belongs_to :profile
- belongs_to :prefectur
- belongs_to :brand
- belongs_to :categorie
- belongs_to :purchased_info
- has_many :images
- has_many :comments

