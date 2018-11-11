require 'rails_helper'

describe User do
  describe '#create' do
    let(:item){create(:item)}

    it "is valid with a name, price, description, status, prefecture, expense, shipping_method, arrival_date, L_category_id" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "is invalid without a prefecture" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture][0]).to include("を入力してください")
    end

    it "is invalid without a expense" do
      item = build(:item, expense: nil)
      item.valid?
      expect(item.errors[:expense]).to include("を入力してください")
    end

    it "is invalid without a shipping_method" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it "is invalid without a arrival_date" do
      item = build(:item, arrival_date: nil)
      item.valid?
      expect(item.errors[:arrival_date]).to include("を入力してください")
    end

    it "is invalid without a L_category_id" do
      item = build(:item, L_category_id: nil)
      item.valid?
      expect(item.errors[:L_category_id]).to include("を入力してください")
    end

    it "is valid with a name that has less than 40 characters " do
      user = build(:item, name: "a"*40)
      expect(item).to be_valid
    end

    it "is invalid with a name that has more than 41 characters " do
      item = build(:item, name: "a"*41)
      expect(item).to be_invalid
    end

    it "is valid with a name that has less than 1000 characters " do
      user = build(:item, description: "a"*1000)
      expect(item).to be_valid
    end

    it "is invalid with a description that has more than 1000 characters " do
      item = build(:item, description: "a"*1001)
      expect(item).to be_invalid


    end

    it "is valid with a price that has more than 300 " do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end

    it "is invalid with a name that has less than 299 " do
      item = build(:item, price: 299)
      expect(item).to be_invalid
    end

    it "is valid with a price that has less than 9999999 " do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end

    it "is invalid with a name that has more than 10000000 " do
      item = build(:item, price: 100000000)
      expect(item).to be_invalid
    end

  end
end
