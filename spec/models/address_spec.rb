# require 'rails_helper'

# RSpec.describe Address, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'rails_helper'


describe Address do
  describe '#create' do

    it "is invalid without a first_name" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      address = build(:address,  first_name_kana: "あ", first_name_kana: "ｱ", first_name_kana: "亜", first_name_kana: "a", first_name_kana: "A", first_name_kana: "1")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("はカタカナで入力してください")
    end


    it "is invalid without a last_name_kana" do
      address = build(:address, last_name_kana: "あ", last_name_kana: "ｱ", last_name_kana: "亜", last_name_kana: "a", last_name_kana: "A", last_name_kana: "1")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("はカタカナで入力してください")
    end

    it "is invalid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without a postal_code" do
      address = build(:address, postal_code: "123456")
      address.valid?
      expect(address.errors[:postal_code]).to include("は7桁の数字を入力して下さい")
    end

    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a street_number" do
      address = build(:address, street_number: nil)
      address.valid?
      expect(address.errors[:street_number]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      address = build(:address, prefecture_code: nil)
      address.valid?
      expect(address.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a telephone_number" do
      address = build(:address, telephone_number: nil)
      address.valid?
      expect(address.errors[:telephone_number]).to include("を入力してください")
    end

    it "is invalid without a telephone_number" do
      address = build(:address, telephone_number: "09012345678910")
      address.valid?
      expect(address.errors[:telephone_number]).to include("は10桁もしくは11桁の番号を入力してください")
    end


  end

end
