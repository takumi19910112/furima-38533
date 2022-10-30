require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '発送先情報' do
    context '保存できるとき' do
      it '全て問題の無い状態であれば登録に成功する' do
        expect(@address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '保存できない時' do
      it '郵便番号が空だと保存できないこと' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @address.prefecture_id = ""
        @address.valid?
        expect(@ddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @address.municipalities = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁以上11桁以内の半角数値以外保存できないこと' do
        @address.phone_number = 100
        @address.valid?
        expect(@address.errors.full_messages).to include('Price is invalid')
      end
      it '電話番号は10桁以上11桁以内の半角数値以外保存できないこと' do
        @address.phone_number = 100000000000
        @address.valid?
        expect(@address.errors.full_messages).to include('Price is invalid')
      end
    end
 end
end
