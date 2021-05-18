require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do

  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  describe '商品購入できる' do
  # 商品購入ができるときについてのテストコード
    context '商品購入ができるとき' do
      it '必須項目とtokenがあれば購入できる' do
        expect(@order_buyer).to be_valid
      end
      it '建物名がなくても保存できること' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end

  # 商品購入ができないときについてのテストコード
    context '商品購入できないとき' do
      it '紐づくuserがいないと購入NG' do
        @order_buyer.user_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it '紐づくitemがないと購入NG' do
        @order_buyer.item_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと購入不可' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号の半角のハイフンがない' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県を未選択だとNG' do
        @order_buyer.area_id = 0
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Area Select")
      end
      it 'cityが空だと購入不可' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号が空だと購入不可' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に数字以外が含まれると購入不可' do
        @order_buyer.phone_number = 'rakuten08012345678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number Input only number")
      end
      it "tokenが空では登録できないこと" do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end

end
