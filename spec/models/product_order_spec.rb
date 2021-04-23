require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  describe '商品購入' do
    before do
      @product_order = FactoryBot.build(:product_order)
    end
    it 'すべての入力が正しければ購入できる' do
      expect(@product_order).to be_valid
    end
    it 'postal_codeが空だと購入できない' do
      @product_order.postal_code = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角ハイフンを含んだ正しい形式でないと購入できない' do
      @product_order.postal_code = '1234567'
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'areaに1が選択されている場合、購入できない' do
      @product_order.area_id = 1
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("Area must be other than 1") 
    end
    it 'cityが空だと購入できない' do
      @product_order.city = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと購入できない' do
      @product_order.house_number = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @product_order.phone_number = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは半角ハイフン無しの11桁以内でないと購入できない' do
      @product_order.phone_number = '12345678901234'
      @product_order.valid?
      expect(@product_order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
