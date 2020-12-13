require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '出品情報の登録' do
      context '出品ができる場合' do
        it 'name,text,image,price,state_id,category_id,prefecture,burden_id,shipping_day_idが存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end

      context '出品ができない場合' do
        it 'nameが空では登録できないこと' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'textが空では登録できないこと' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが全角数字では登録できないこと' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'priceが299円以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'priceが10,000,000円以上では登録できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'stateは選択しないと登録できないこと' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('State Select')
        end

        it 'categoryは選択しないと登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end

        it 'prefectureは選択しないと登録できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end

        it 'burdenは選択しないと登録できないこと' do
          @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Burden Select')
        end

        it 'shipping_dayは選択しないと登録できないこと' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping day Select')
        end
      end
    end
  end
end
