require 'rails_helper'

RSpec.describe BuyShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipment = FactoryBot.build(:buy_shipment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '商品購入ができる場合' do
    it 'すべての値が正しく入力されていれば購入ができること' do
      expect(@buy_shipment).to be_valid
    end
    it 'buildingは空でも購入ができること' do
      @buy_shipment.building = ''
      expect(@buy_shipment).to be_valid
    end
  end

  context '商品購入ができない場合' do
    it 'tokenが空では登録できないこと' do
      @buy_shipment.token = ''
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空では登録できないこと' do
      @buy_shipment.postal_code = ''
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
      @buy_shipment.postal_code = '1234567'
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @buy_shipment.prefecture_id = 0
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では登録できないこと' do
      @buy_shipment.city = ''
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include("City can't be blank")
    end
    it 'address_lineが空では登録できないこと' do
      @buy_shipment.address_line = ''
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include("Address line can't be blank")
    end
    it 'phone_numberが空では登録できないこと' do
      @buy_shipment.phone_number = ''
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字では登録できないこと' do
      @buy_shipment.phone_number = '０９０１２３４５６７８'
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberに半角ハイフンが入ると登録できない' do
      @buy_shipment.phone_number = '090-1234-5678'
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが9桁以下の場合登録できない' do
      @buy_shipment.phone_number = '090123456'
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが12桁以上の場合登録できない' do
      @buy_shipment.phone_number = '090123456789'
      @buy_shipment.valid?
      expect(@buy_shipment.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
