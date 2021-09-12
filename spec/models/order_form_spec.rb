require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    order = FactoryBot.create(:order)
    sleep 0.5
    @order_form = FactoryBot.build(:order_form, order_id: order.id)
  end

  describe '商品の購入' do

    context '商品を購入できるとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @order_form.municipalities = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空では購入できない' do
        @order_form.tel_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'prefectureが「 --- 」では購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'postal_codeはハイフンを含んだ正しい形式でないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'tel_numberは0から始まる半角整数でないと購入できない' do
        @order_form.tel_number = '11123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel number is invalid')
      end
      it 'tel_numberは9桁以下では購入できない' do
        @order_form.tel_number = '012345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel number is invalid')
      end
      it 'tel_numberは12桁以上では購入できない' do
        @order_form.tel_number = '000123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel number is invalid')
      end
      it 'tel_numberは全角では購入できない' do
        @order_form.tel_number = '０１２３４５６７８９'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel number is invalid')
      end
      it 'tokenが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end