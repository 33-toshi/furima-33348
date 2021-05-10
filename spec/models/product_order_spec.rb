require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  before do
    user = FactoryBot.create( :user )
    product = FactoryBot.create( :product )
    @product_order = FactoryBot.build(:product_order, user_id: user.id, product_id: product.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'すべての入力とtokenが正しければ購入できる' do
        expect(@product_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @product_order.building_name = nil
        expect(@product_order).to be_valid
      end

    end
    context '商品購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @product_order.postal_code = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角ハイフンを含んだ正しい形式でないと購入できない' do
        @product_order.postal_code = '1234567'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('郵便番号は-(ハイフン)をいれて入力してください')
      end
      it 'areaに1が選択されている場合、購入できない' do
        @product_order.area_id = 1
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空だと購入できない' do
        @product_order.city = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("市町村を入力してください")
      end
      it 'house_numberが空だと購入できない' do
        @product_order.house_number = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @product_order.phone_number = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberは半角ハイフン無しの11桁以内でないと購入できない' do
        @product_order.phone_number = '123456789012'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('電話番号は-(ハイフン)なし、半角数字10桁もしくは11桁で入力してください')
      end
      it 'phone_numberが英数混合では購入できない' do
        @product_order.phone_number = 'ooo12345678'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('電話番号は-(ハイフン)なし、半角数字10桁もしくは11桁で入力してください')
      end
      it 'tokenが空では購入できない' do
        @product_order.token = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが空では購入できない' do
      @product_order.user_id = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("Userを入力してください")
      end
      it 'product-idが空では購入できない' do
        @product_order.product_id = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Productを入力してください")
      end
    end
  end
end
