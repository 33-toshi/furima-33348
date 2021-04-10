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
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameがないと出品できない' do
        @product.product_name =  ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionがないと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryに１が選択されている場合出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'detailに１が選択されている場合出品できない' do
        @product.detail_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Detail must be other than 1")
      end
      it 'delivery_feeに１が選択されている場合出品できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it 'areaに１が選択されている場合出品できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 1")
      end
      it 'durationに１が選択されている場合出品できない' do
        @product.duration_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Duration must be other than 1")
      end
      it 'priceがないと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが￥300以下だと出品できない' do
        @product.price = 10
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'pirceが¥10,000,000以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが半角数字ではないと登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは全角では登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは半角英数字混合では登録できない' do
        @product.price = 'aa1000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは半角英語だけでは登録できない' do
        @product.price = 'abcde'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      
    end
  end
end
