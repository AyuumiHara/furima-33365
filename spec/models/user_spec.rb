require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    
  # ユーザー新規登録できるときについてのテストコード
  describe 'ユーザ新規登録' do
    context '新規登録できるとき' do
      it '入力必須項目がすべて存在すれば登録できる(nickname,email,password,名前,名前カタカナ,生年月日)' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数である' do
        @user.password = "a12345"
        expect(@user).to be_valid
      end
      it 'ユーザ本名：名字が入力されていると登録できる' do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      it 'ユーザ本名：名前が入力されていると登録できる' do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it 'ユーザ本名：名字カタカナが入力されていると登録できる' do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it 'ユーザ本名：名前カタカナが入力されていると登録できる' do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it '生年月日が入力されていると登録できる' do
        @user.birth_day = "2000-01-01"
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
#日本語はまた後で20210427 メンター谷口さん expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が空だとNG' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名字カタカナが空だとNG' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前カタカナが空だとNG' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '生年月日が空だとNG' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      # ▼カタカナテスト
      it '名字カタカナが全角カタカナでなければ登録できない' do
        @user.last_name_kana = "あいうえおおお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '名前カタカナが全角カタカナでなければ登録できない' do
        @user.first_name_kana = "あいうえおおお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end
