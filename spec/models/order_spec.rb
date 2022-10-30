require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.jpg")
    @item.save
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
  end
  describe "購入履歴の保存" do
    context"購入履歴が残せるとき" do
      it "全てそろっていれば登録できる" do
       expect(@order).to be_valid
      end
    end
    context "購入履歴が残せないとき" do
    it "ユーザーidが空では登録できない" do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "User must exist"
      end
      it "アイテムidが空では登録できない" do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Item must exist"
        end
    end
  end
end