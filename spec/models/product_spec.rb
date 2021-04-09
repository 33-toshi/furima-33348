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
      it 'categoryの情報がないと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'detailの情報がないと出品できない' do
        @product.detail_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Detail can't be blank")
      end
      it 'delivery_feeの情報がないと出品できない' do
        @product.delivery_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'areaの情報がないと出品できない' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it 'durationの情報がないと出品できない' do
        @product.duration_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Duration can't be blank")
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
      it 'pirceが¥9,999,999以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが半角数字ではない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      
    end
  end
end
