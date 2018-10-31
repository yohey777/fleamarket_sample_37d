# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#最終課題
メルカリのクローンサイト(フリーマーケット)

##実装予定機能
(1)ユーザーの新規登録機能
・ニックネーム
・メールアドレス
・パスワード
・プロフィール文章
・電話番号
・名前（姓名）
・名前（かな入力）
・住所
・生年月日
・支払い方法

(2)ユーザのログイン、ログアウト

(3)カテゴリ別の商品一覧表示

(4)商品出品
・商品画像（最大4枚）
・商品名
・商品説明
・商品カテゴリー
・商品サイズ
・ブランド（任意）
・商品の状態
・配送方法
・配送元地域
・発送までの日数
・価格
・支払い方法（クレジットカードの支払いのみ）

(5)商品の詳細表示
(6)出品した商品の編集
(7)出品した商品の削除
(8)パンくず表示
(9)商品検索機能(通常検索およびカテゴリ検索など商品絞り込み検索)
(10)商品へのいいね機能
(11)ユーザーへの評価機能（購入者、販売者がお互いにgood,normal,badで評価することができる）


##ER図
https://gyazo.com/c6ce7c1d33a5cd2bf005277a2c99bd50


## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index, unique: true|
|email|string|null: false, add_index, unique: true|
|password|string|null: false|
|profile|text|-------|
|phone|string|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|address|string|null: false|
|birthday|string|null: false|
|payment_method|string|null: false|

### Association
- has_many :buyer_deals, class_name: 'Deal', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_deals, class_name: 'Deal', foreign_key: :seller_id, dependent: :destroy
- has_many :items,  through: :deals
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :rates, dependent: :destroy


## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|deal_id|integer|null: false,foreign_key: true|
|rater_id|integer|null: false,foreign_key: true|
|ratee_id|integer|null: false,foreign_key: true|

### Association
- belongs_to :deal
- belongs_to :rater, class_name: 'User'
- belongs_to :ratee, class_name: 'User'

### enum
- rates


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|price|integer|null: false|
|description|text|null: false, add_index|
|status|integer|null: false|
|prefecuture|integer|null: false|
|expense|integer|null: false|
|shipping_method|integer|null: false|
|arrival_date|integer|null: false|
|likes_count|integer|null: false|
|L_category_id|integer|null: false, foreign_key: true|
|M_category_id|integer|null: false, foreign_key: true|
|S_category_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :L_category
- belongs_to :M_category
- belongs_to :S_category
- belongs_to :size
- belongs_to :brand
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :buyer_deals, class_name: 'Deal', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_deals, class_name: 'Deal', foreign_key: :seller_id, dependent: :destroy
- has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :deals
- has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :deals

### enum
- status
- prefecuture
- expense
- shipping_method
- arrival_date


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|integer|null: false,foreign_key: true|
|user_id|integer|null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## dealsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association

- has_one :rate
- belongs_to :item
- belongs_to :seller, class_name: 'User', foreign_key: :seller_id
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id


## L_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :M_categories


## M_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|L_category_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :L_category
- has_many :items
- has_many :S_categories


## S_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|M_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :M_category
- has_many :items
- has_many :sizes


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|S_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :S_category
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :item

