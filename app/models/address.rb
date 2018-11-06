class Address < ApplicationRecord
   belongs_to :user

   validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください'}


   validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

   validates :postal_code, presence: true, format: { with: /\A\d{3}\-?\d{4}\z/ , message: 'は7桁の数字を入力して下さい'}

   VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
   validates :telephone_number, presence: true, format: { with: VALID_PHONE_REGEX , message: 'は10桁もしくは11桁の番号を入力してください'}


end
