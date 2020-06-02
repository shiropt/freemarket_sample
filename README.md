# 概要

テックキャンプの最終課題にて作成したアプリケーションを紹介します。

また自身で実装した箇所、および開発を通じて得られた経験についても紹介します。

# アプリケーション情報
## アプリケーション概要
フリーマーケットのアプリケーションを作成しました。

### 接続先情報

+ URL http://18.180.195.19/
+ ID/Pass
  + ID: 74g
  + Pass: 7474g
+ テスト用アカウント等
  + 購入者用
    + メールアドレス: iii@mail.com
    + パスワード: i1i1i1i1
  + 購入用カード情報
    + 番号： 5105105105105100
    + 期限： 2020/12/01
    + セキュリティコード：123
  + 出品者用
    + メールアドレス名: nnn@mail.com
    + パスワード: n2n2n2n2

### 開発状況

+ 開発環境
  + Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
+ 開発期間と平均作業時間
  + 開発期間：5/5〜5/29（25日間）
  + 1日あたりの平均作業時間：10時間
+ 開発体制
  + 人数：4人
  + アジャイル型開発（スクラム）
  + Trelloによるタスク管理
  
### 動作確認方法
+ Chromeの最新版を利用してアクセスしてください。
  + ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。
+ 接続先およびログイン情報については、上記の通りです。
+ 同時に複数の方がログインしている場合に、ログインできない可能性がございます。
+ テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
+ テストアカウントでログイン→トップページから商品検索→商品選択→テストアカウント購入用カードで商品購入
+ 確認後、ログアウト処理をお願いします。

## 開発担当箇所
### 担当箇所一覧と確認方法
+ デプロイ
+ DB設計
  + READMEに記載があります。
+ トップページ：フロントサイド / サーバーサイド
+ ユーザーマイページ：フロントサイド
  + テストアカウントでログイン→マイページリンクから確認できます。
+ 商品検索：フロントサイド / サーバーサイド
  + トップページの検索窓から商品名の検索ができます。

### 各担当箇所の詳細
+ デプロイ
  + AWSを用いたデプロイ設定、basic認証の実装、Capistranoでの自動デプロイ設定、S3での画像アップロードを行いました。
+ DB設計
  + ER図を作成し、READMEに各テーブルのカラムやテーブル同士のアソシエーションを記載しました。
+ トップページ
  + 出品商品をカテゴリー・ブランド毎に一覧表示しました。購入済み商品は一覧から削除される仕様になっています。
+ ユーザーマイページ
  + ログイン後、ユーザーマイページから会員情報の変更や、購入クレジットカード情報の登録ができるリンクを作成しました。
+ 商品検索
  + あいまい検索でユーザーが入力した文字を商品名に含む商品を検索できるようにしました。複数文字検索も可能です。

## 開発を通じて得られた知見
### 工夫した点
#### チームとして工夫を行った点
+ 本番環境での挙動確認
  + 開発環境では動いていても本番環境では動かなくなるということもあるので、1機能を実装したらデプロイをして本番環境での挙動を確認するということを行っていました。一気に複数の機能をデプロイするとエラーが出た際の原因究明も難しくなってしまうと考え、最低1日1回はメンバー全員で確認するようにしていました。
#### 個人として工夫を行った点
+ コメントアウト
  + 他のメンバーがコードを見た際に何をしているコードなのかわかるようにするためにコメントアウトを積極的に使うことを心がけました。また、あとから修正点があっても修正しやすいように共通の記述内容については極力まとめて記述するようにしました。
  
### 苦労した点
#### チームとして苦労した点
+ マイグレーションファイルのバージョン管理
  + チーム開発ではDBの設計に変更があった際にマイグレーションファイルを安易に変更してしまうと他人のDBに悪影響を及ぼすという認識が当初なかったため、まちまちになってしまったチーム全員のDBの仕様を統一させるのに苦労しました。DBの設計に修正が必要になった場合はマイグレーションファイルを追加する形で変更をしなければならないと学びました。今後より複雑なDBの管理をしていくこともあると思うので、今回のチーム開発での失敗を学びにしていこうと思います。
#### 個人として苦労した点
+ DB設計
  + 開発を始める前に必要なテーブル、カラム、アソシエーションを考え、ER図を作成してから開発に取り掛かりましたが、開発を進めていくうちにDBの仕様に変更点がいくつも出てきてしまいました。テーブル同士の関係性が複雑であるほど、後から修正を加えていくのは大変な作業になると思うので、DB設計は時間をかけてでも正確に行わなければならない作業であると学びました。今後は作るアプリケーションの仕様を予めきちんと理解をしたうえでDB設計を行おうと意識するようになりました。
+ デプロイエラー解消
  + 本番環境へのデプロイの際にエラーが出てデプロイができず、原因究明に苦労しました。エラー文を読んでも原因が何なのか理解できませんでしたが、logを見てみることで解決の糸口が見つかることもありました。エラー文からだけでなくlogから原因を探るということの必要性を学びました。エラーに遭遇した時に1方向からではなく、考えられるあらゆる可能性を探って仮説を立てて対処していきます。








# DB設計

## usersテーブル
|Column            |Type    |Options                          |
|------------------|--------|---------------------------------|
|last_name         |string  |null: false                      |
|first_name        |string  |null: false                      |
|last_name_kana    |string  |null: false                      |
|first_name_kana   |string  |null: false                      |
|email             |string  |null: false, unique: true        |
|gender            |integer |                                 |
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
|user_id         |integer |null: false, foreign_key: true     |

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture
  


## profilesテーブル
|Column        |Type     |Options                            |
|--------------|---------|-----------------------------------|
|user_id       |integer  |null: false, foreign_key: true     |
|nickname      |string   |null: false                        |
|image         |string   |                                   |
|profile       |text     |                                   |

### Association
- belongs_to :user



### credit_cardsテーブル
|Column       |Type  |Options                       |
|-------------|------|------------------------------|
|user_id      |intger|null: false, foreign_key: true|
|customer_id  |string|null: false                   |

### Association
- belongs_to :user



### commentsテーブル
|Column|Type|Options|
|-------|------|------------------------------|
|user_id|intger|null: false, foreign_key: true|
|item_id|intger|null: false, foreign_key: true|
|comment|text  |null: false                   |

### Association
- belongs_to :user
- belongs_to :item



### imagesテーブル
|Column |Type   |Options                        |
|-------|-------|-------------------------------|
|image  |string |null: false                    |
|item_id|integer|null: false, foreign_key: true |

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
|user_id      |integer   |null: false, foreign_key: true|
|item_id      |integer   |null: false, foreign_key: true|
|purchase_date|date      |null: false                   |
|shipping_fee |integer   |null: false                   |

### Association
- belongs_to :item
- belongs_to :user



### itemsテーブル
|Column           |Type     |Options                       |
|-----------------|---------|------------------------------|
|name             |string   |null: false                   |
|description      |text     |null: false                   |
|price            |integer  |null: false                   |
|size_id          |integer  |                              |
|category_id      |integer  |null: false                   |
|brand            |string   |                              |
|condition_id     |integer  |null: false                   |
|shipping_fee_side|boolean  |null: false                   |
|prefectures_id   |integer  |null: false                   |
|shipping_days_id |integer  |                              |
|user_id          |integer  |null: false                   |
|purchased_info_id|integer  |             foreign_key: true|

### Association  
- belongs_to :user
- belongs_to :category
- has_one :purchased_info
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :size
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_day
- has_many :images
- has_many :comments

