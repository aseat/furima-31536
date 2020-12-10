require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー情報の登録' do
      context 'ユーザー情報の登録ができる場合' do
        it 'password,password_confirmation,family_name,name,family_namekana,namekana,birthが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'family_nameが英数字以外であれば登録できること' do
          @user.family_name = '渡辺'
          expect(@user).to be_valid
        end

        it 'nameが英数字以外であれば登録できること' do
          @user.name = '曜'
          expect(@user).to be_valid
        end

        it 'family_namekanaがカタカナであれば登録できること' do
          @user.family_namekana = 'ワタナベ'
          expect(@user).to be_valid
        end
      end

      context 'ユーザー情報の登録ができない場合' do
        it 'namekanaがカタカナであれば登録できること' do
          @user.namekana = 'ヨウ'
          expect(@user).to be_valid
        end

        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailには@が含まれていないと登録できないこと' do
          @user.email = 'yosoro'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'family_nameが空では登録できないこと' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end

        it 'family_namekanaが空では登録できないこと' do
          @user.family_namekana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family namekana can't be blank", 'Family namekana Full-width katakana characters')
        end

        it 'namekanaが空では登録できないこと' do
          @user.namekana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Namekana can't be blank")
        end

        it 'birthが空では登録できないこと' do
          @user.birth = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth can't be blank")
        end

        it 'passwordが半角英数字5文字以下であれば登録できないこと' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '000000a1'
          @user.password_confirmation = '000000a'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '000000'
          @user.password_confirmation = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'passwordが半角英字のみでは登録できないこと' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'family_nameが英数字では登録できないこと' do
          @user.family_name = 'watanabe'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name Full-width characters')
        end

        it 'nameが英数字だと登録できないこと' do
          @user.name = 'you'
          @user.valid?
          expect(@user.errors.full_messages).to include('Name Full-width characters')
        end

        it 'family_namekanaがカタカナ以外では登録できないこと' do
          @user.family_namekana = 'watanabe'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family namekana Full-width katakana characters')
        end

        it 'namekanaがカタカナ以外であれば登録できない' do
          @user.namekana = '渡辺'
          @user.valid?
          expect(@user.errors.full_messages).to include('Namekana  Full-width katakana characters')
        end
      end
    end
  end
end
