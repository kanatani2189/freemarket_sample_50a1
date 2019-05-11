require 'rails_helper'
describe User do
  describe '#create' do
    it "全てのカラムデータが存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
    end

     it "nicknameがないと登録できないこと" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
    end

     it "nicknameが20文字を超えると登録できないこと" do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:nickname][0]).to include("is too long")
    end

     it "nicknameが20文字以下だと登録できること" do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user).to be_valid
    end

     it "emailがないと登録できないこと" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
    end

     it "emailが重複していると登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
    end

     it "passwordが5文字以下だと登録できないこと" do
        user = build(:user, password: "aaaaa", password_confirmation: "aaaaa")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
    end

     it "passwordが数字のみだと登録できないこと" do
        user = build(:user, password: "111111", password_confirmation: "111111")
        user.valid?
        expect(user.errors[:password][0]).to include("invalid")
    end

     it "passwordが6文字以上、且つ、半角英字が存在すれば登録できること" do
        user = build(:user, family_name: "11111a")
        user.valid?
        expect(user).to be_valid
    end

     it "passwordが英字のみで登録できること" do
        user = build(:user, family_name: "aaaaaa")
        user.valid?
        expect(user).to be_valid
    end

     it "passwordが6文字以上、且つ、記号が存在すれば登録できること" do
        user = build(:user, family_name: "11111@")
        user.valid?
        expect(user).to be_valid
    end

     it "passwordが記号のみでも登録できること" do
        user = build(:user, family_name: "@@@@@@")
        user.valid?
        expect(user).to be_valid
    end

     it "family_nameがないと登録できないこと" do
        user = build(:user, family_name: "")
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
    end

     it "family_nameが35文字を超えると登録できないこと" do
        user = build(:user, family_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:family_name][0]).to include("is too long")
    end

     it "family_nameが35文字以下だと登録できること" do
        user = build(:user, family_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user).to be_valid
    end

     it "first_nameがないと登録できないこと" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
    end

     it "first_nameが35文字を超えると登録できないこと" do
        user = build(:user, first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:first_name][0]).to include("is too long")
    end

     it "first_nameが35文字以下だと登録できること" do
        user = build(:user, first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user).to be_valid
    end

     it "family_name_kanaがないと登録できないこと" do
        user = build(:user, family_name_kana: "")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

     it "family_name_kanaが35文字を超えると登録できないこと" do
        user = build(:user, family_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:family_name_kana][0]).to include("is too long")
    end

     it "family_name_kanaが35文字以下だと登録できること" do
        user = build(:user, family_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user).to be_valid
    end

     it "first_name_kanaがないと登録できないこと" do
        user = build(:user, first_name_kana: "")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

     it "first_name_kanaが35文字を超えると登録できないこと" do
        user = build(:user, first_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:first_name_kana][0]).to include("is too long")
    end

     it "first_name_kanaが35文字以下だと登録できること" do
        user = build(:user, first_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user).to be_valid
    end

     it "birth_yearがないと登録できないこと" do
        user = build(:user, birth_year: nil)
        user.valid?
        expect(user.errors[:birth_year]).to include("can't be blank")
    end

     it "birth_monthがないと登録できないこと" do
        user = build(:user, birth_month: nil)
        user.valid?
        expect(user.errors[:birth_month]).to include("can't be blank")
    end

     it "birth_dateがないと登録できないこと" do
        user = build(:user, birth_date: nil)
        user.valid?
        expect(user.errors[:birth_date]).to include("can't be blank")
    end

     it "cityがなくても登録できること" do
        user = build(:user, city: nil)
        user.valid?
        expect(user).to be_valid
    end

     it "addressがなくても登録できること" do
        user = build(:user, address: nil)
        user.valid?
        expect(user).to be_valid
    end

     it "streetがなくても登録できること" do
        user = build(:user, street: nil)
        user.valid?
        expect(user).to be_valid
    end

   end
end 