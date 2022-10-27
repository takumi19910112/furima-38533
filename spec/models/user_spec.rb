require 'rails_helper'

RSpec.describe User, type: :model do
   before do
      @user = FactoryBot.build(:user)
    end
    describe "ユーザー新規登録" do
      context"新規登録できるとき" do
        it "全てそろっていれば登録できる" do
         expect(@user).to be_valid
        end
      end
      context "新規登録できないとき" do
      it "ニックネームが空では登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
        end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it "パスワードが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end
        it "誕生日が空では登録できない" do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Birth day can't be blank"
        end
        it "名字が空では登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end
        it "名前が空では登録できない" do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank"
        end
        it "カナ名字が空では登録できない" do
          @user.read_first = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Read first can't be blank"
        end
        it "カナ名前が空では登録できない" do
          @user.read_last = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Read last can't be blank"
        end
        it "重複したメールアドレスは登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
         expect(another_user.errors.full_messages).to include('Email has already been taken')
         end
        it "メールアドレスに＠を含まない場合は登録できない" do
         @user.email = 'testmail'
         @user.valid?
         expect(@user.errors.full_messages).to include 'Email is invalid'
        end
       it "パスワードが６文字未満だと登録できない" do
          @user.password = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
          end
       it "パスワードと確認用のパスワードか不一致だと登録できない" do
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
       it "パスワードが半角英字のみでは登録できない" do
          @user.password = 'aaaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include  "Password には英字と数字の両方を含めて設定してください"
        end
       it "パスワードが半角数字のみでは登録できない" do
         @user.password = '1111111'
         @user.valid?
          expect(@user.errors.full_messages).to include  "Password には英字と数字の両方を含めて設定してください"
        end
        it "パスワードに全角文字を含むと登録できない" do
         @user.password = "ああああああ"
         @user.valid?
         expect(@user.errors.full_messages).to include  "Password には英字と数字の両方を含めて設定してください"
       end
       it "姓（全角）に半角文字が含まれていると登録できない" do
         @user.first_name = 'abc'
         @user.valid?
          expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
       end
       it "名（全角）に半角文字が含まれていると登録できない" do
          @user.last_name = 'abc'
         @user.valid?
         expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
        end
        it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.read_first = 'あ亜3e@'
        @user.valid?
        expect(@user.errors.full_messages).to include "Read first カタカナを使用してください"
      end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.read_last = 'あ亜3e@'
        @user.valid?
        expect(@user.errors.full_messages).to include "Read last カタカナを使用してください"
      end
   end
  end
end