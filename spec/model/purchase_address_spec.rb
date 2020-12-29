require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe 'create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    describe '購入に関する情報の登録' do
      context '購入できる場合' do
        it '必要な情報を適切に入力すると、商品の購入ができること' do
          expect(@purchase_address).to be_valid
        end
      end

      context '購入できない場合' do
        it 'tokenが空だと購入できないこと' do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'post_numberが空だと購入できないこと' do
          @purchase_address.post_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Post number can't be blank")
        end

        it 'prefectureは選択しないと登録できないこと' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
        end

        it 'addressesが空だと購入できないこと' do
          @purchase_address.addresses = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Addresses can't be blank")
        end

        it 'phone_numberが空では購入できないこと' do
          @purchase_address.phone_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'post_numberハイフンがないと購入できないこと' do
          @purchase_address.post_number = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Post number Input correctly')
        end

        it 'phone_numberにハイフンがあると購入できないこと' do
          @purchase_address.phone_number = '09012345-78'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
        end
      end
    end
  end
end
