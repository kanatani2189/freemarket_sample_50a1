require 'rails_helper'
describe Item do
  describe '#create' do
    it "全てのカラムデータが存在すれば登録できること" do
        item = build(:item)
        expect(item).to be_valid
    end

     it "nameがないと登録できないこと" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
    end

     it "nameが40文字を超えると登録できないこと" do
        item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item.errors[:name][0]).to include("is too long")
    end

     it "nameが40文字以下だと登録できること" do
        item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item).to be_valid
    end

     it "descriptionがないと登録できないこと" do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
    end

    it "sizeがなくても登録できること" do
        item = build(:item, size: nil)
        item.valid?
        expect(item).to be_valid
    end

    it "brand_idがなくても登録できること" do
        item = build(:item, brand_id: nil)
        item.valid?
        expect(item).to be_valid
    end

    it "conditionがないと登録できないこと" do
        item = build(:item, condition: nil)
        item.valid?
        expect(item.errors[:condition]).to include("can't be blank")
    end

    it "shipping_burdenがないと登録できないこと" do
        item = build(:item, shipping_burden: nil)
        item.valid?
        expect(item.errors[:shipping_burden]).to include("can't be blank")
    end

    it "shipping_methodがないと登録できないこと" do
        item = build(:item, shipping_method: nil)
        item.valid?
        expect(item.errors[:shipping_method]).to include("can't be blank")
    end

    it "prefecture_idがないと登録できないこと" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "estimated_dateがないと登録できないこと" do
        item = build(:item, estimated_date: nil)
        item.valid?
        expect(item.errors[:estimated_date]).to include("can't be blank")
    end

    it "priceが300未満だと登録できないこと" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが99999999を越えると登録できないこと" do
        item = build(:item, price: 100000000)
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 99999999")
    end

    it "priceが300以上、且つ、99999999以下だと登録できること" do
        item = build(:item, price: 300)
        item.valid?
        expect(item).to be_valid
    end

  end
end 