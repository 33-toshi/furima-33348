require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'すべての入力があれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageがないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it 'product_nameがないと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionがないと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'categoryに１が選択されている場合出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'detailに１が選択されている場合出品できない' do
        @product.detail_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'delivery_feeに１が選択されている場合出品できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'areaに１が選択されている場合出品できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'durationに１が選択されている場合出品できない' do
        @product.duration_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'priceがないと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが￥300以下だと出品できない' do
        @product.price = 10
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は300円〜9,999,999円で入力してください")
      end
      it 'pirceが¥10,000,000以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は300円〜9,999,999円で入力してください")
      end
      it 'priceが半角数字ではないと登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it 'priceは全角では登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it 'priceは半角英数字混合では登録できない' do
        @product.price = 'aa1000'
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it 'priceは半角英語だけでは登録できない' do
        @product.price = 'abcde'
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
