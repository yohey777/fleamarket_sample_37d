class Address < ApplicationRecord
   belongs_to :user

   validates :first_name, presence: true

   validates :last_name, presence: true

   validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください'}

   validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください'}

   validates :postal_code, presence: true, format: { with: /\A\d{3}\-?\d{4}\z/ , message: 'は7桁の数字を入力して下さい'}

   validates :prefecture_code, presence: true

   validates :city, presence: true

   validates :street_number, presence: true


   VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
   validates :telephone_number, presence: true, format: { with: VALID_PHONE_REGEX , message: 'は10桁もしくは11桁の番号を入力してください'}

  include JpPrefecture
  jp_prefecture :prefecture_code

 def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code)&.to_s
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end





end
