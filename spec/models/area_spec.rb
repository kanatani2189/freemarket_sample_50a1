require 'rails_helper'
describe User do
  describe '#create' do
    it "nameがあれば登録できること" do
        area = build(:area)
        expect(area).to be_valid
    end
  end
end