class Item < ApplicationRecord

  belongs_to :L_category, optional: true
  belongs_to :M_category, optional: true
  belongs_to :S_category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :buyer_deals, class_name: 'Deal', foreign_key: :buyer_id, dependent: :destroy
  has_many :seller_deals, class_name: 'Deal', foreign_key: :seller_id, dependent: :destroy
  has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :deals
  has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :deals
  # ファイルアップロード
  accepts_nested_attributes_for :images
  # バリデーション
  validates :name, presence: true, length: { maximum: 40}
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :status,:L_category_id, :M_category_id,:expense,:shipping_method,:arrival_date,:shipping_method,presence: true

  enum status: {
    新品、未使用:1, 未使用に近い:2, 目立った傷や汚れなし:3, やや傷や汚れあり:4, 傷や汚れあり:5, 全体的に状態が悪い:6
  }
  enum prefecture: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,岐阜県:21,静岡県:22,愛知県:23,三重県:24,滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,徳島県:36,香川県:37,愛媛県:38,高知県:39,福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  enum expense: {
    送料込み:1, 着払い:2
  }
  enum shipping_method: {
    未定:1, クロネコヤマト:2, ゆうパック:3, ゆうメール:4, らくらくメルカリ便:5, レターパック:6, 普通郵便（定形、定形外）:7, クリックポスト:8, ゆうパケット:9
  }
  enum arrival_date: {
    １〜２日で発送:1, ２〜３日で発送:2, ４〜７日で発送:3
  }
  enum brand_id:{
    シュプリーム:1
  }
  enum size_id:{
    XS以下:1, S:2, M:3, L:4, XL:5, XL以上:6, FREE_SIZE:7
  }
  enum L_category_id:{
    レディース:1, メンズ:2, ベビー・キッズ:3, インテリア・住まい・小物:4, 本・音楽・ゲーム:5, おもちゃ・ホビー・グッズ:6, コスメ・香水・美容:7, 家電・スマホ・カメラ:8, スポーツ・レジャー:9, ハンドメイド:10, チケット:11, 自転車・オートバイ:12
  }
  enum M_category_id:{
    アクセサリー:1, トップス:2, ジャケット・アウター:3, パンツ:4, スカート:5, ワンピース:6, 靴:7, ルームウェア・パジャマ:8, レッグウェア:9, 帽子:10, バッグ:11, アクセサリー:12, ヘアアクセサリー:13, 小物:14, 時計:15, ウィッグ・エクステ:16, 浴衣・水着:17, スーツ・フォーマル・ドレス:18, マタニティ:19
  }
  enum S_category_id:{
    その他:1
  }
end
