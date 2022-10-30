require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入履歴と発送先の保存' do
    before do
      order = FactoryBot.build(:order)
      @order_address = FactoryBot.build(:order_address, user_id: user.id,item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@orer_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_address.prefecture_id = ""
        @oeder_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @donation_address.price = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Price can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @donation_address.price = '２０００'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Price is invalid')
      end
      it '電話番号が空では保存できないこと' do
        @donation_address.price = 0
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Price is invalid')
      end
      it '電話番号は10桁以上11桁以内の半角数値以外保存できないこと' do
        @donation_address.price = 1000001
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @donation_address.user_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("User can't be blank")
      end
      it 'クレジットカードのトークンが空では保存できないこと' do
        @donation_address.user_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
