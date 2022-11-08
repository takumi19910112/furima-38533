require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.images = [ fixture_file_upload("/files/test_image.jpg")]
  end
  describe '商品出品機能' do
    context 'できる時' do
      it '全て問題の無い状態であれば登録に成功する' do
        expect(@item).to be_valid
      end
    end
    context 'できない時' do
      it '商品名がないと出品出来ない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品説明がないと出品出来ない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品説明を入力してください"
      end
      it '金額の表示がないと出品出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "金額を入力してください"
      end
      it 'カテゴリーがないと出品出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it '商品状態がないと出品出来ない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it '送料の記載がないと出品できない' do
        @item.contribution_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料をどちらが負担するかを選択してください"
      end
      it '発送場所の記載がないと出品出来ない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "都道府県を選択してください"
      end
      it '発送目安がないと出品出来ない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it '価格が300円未満だと出品できない' do
        @item.price = '150'
        @item.valid?
        expect(@item.errors.full_messages).to include "金額は300以上の値にしてください"
      end
      it '価格が10000000円以上だと出品出来ない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "金額は9999999以下の値にしてください"
      end
      it '価格は半角数値でないと出品出来ない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include "金額は数値で入力してください"
      end
      it 'アクティブハッシュで実装した項目については、未選択項目が選択されると保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "都道府県を選択してください"
      end
      it 'アクティブハッシュで実装した項目については、未選択項目が選択されると保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it 'アクティブハッシュで実装した項目については、未選択項目が選択されると保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it 'アクティブハッシュで実装した項目については、未選択項目が選択されると保存できない' do
        @item.contribution_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料をどちらが負担するかを選択してください"
      end
      it 'アクティブハッシュで実装した項目については、未選択項目が選択されると保存できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it '画像が添付されていないと出品出来ない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像は1枚以上5枚以下にしてください"
      end
      it 'ユーザーが紐づいていないと出品出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Userを入力してください"
      end

    end
  end
end