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
https://gyazo.com/9c08879aa1418d0651a1852650a620c7

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## mainsizeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :subsizes


## subsizeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|mainsize_id|integer|null: false,foreign_key: true|

### Association
- belongs_to :mainsize


## dealテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|

### Association
- belongs_to :mainsize

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index, unique: true|
|mail|string|null: false, add_index, unique: true|
|password|string|null: false|
|profile_comment|text|-------|
|telephone_number|string|null: false, add_index, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|prefecture|string|null: false|
|address|string|null: false|
|birth_day|string|null: false|
|method_of_payment|string|null: false|

### Association
- has_many :reputations
- has_many :items,  through: :deals
- has_many :likes
- has_many :comments
- has_many :deals

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|user_id|integer|null: false,foreign_key: true|
|created_at|string|null: false|
|status|text|null: false|
|price|integer|null: false|
|subsize_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|likes_count|integer|null: false|
|category_id|integer|null: false, foreign_key: true|

### Association
- belngs_to :subsize
- belongs_to :brand
- belongs_to:category
- has_many :images
- has_many :deliverys
- has_many :comments
- has_many :users,  through: :deals
- has_many :likes
- has_many :deals


## dealsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|dealt_at|datetime|null: false|

### Association

- belongs_to :item
- belongs_to :user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|Ccategory_id|integer|null: false,foreign_key: true|

### Association

- has_many :items

## reputationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|enum|integer|null: false|


### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|integer|null: false,foreign_key: true|
|user_id|integer|null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## deliverysテーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|
|shipping_method|string|null: false|
|item_id|integer|null: false,foreign_key: true|
|prefecture_id|integer|null: false,foreign_key: true|


### Association
- belongs_to :item
- belongs_to :prefecture

## prefectureテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :deliverys

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false,foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :item


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|null: false|

### Association
- has_many :items

