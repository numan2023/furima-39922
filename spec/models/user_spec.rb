require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英数字両方含めないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが英数字両方含めないと登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'seiが空では登録できない' do
      @user.sei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei can't be blank")
    end
    it 'meiが空では登録できない' do
      @user.mei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei can't be blank")
    end
    it 'sei_kanaが空では登録できない' do
      @user.sei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei kana can't be blank")
    end
    it 'mei_kanaが空では登録できない' do
      @user.mei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '姓(sei)が全角（漢字・ひらがな・カタカナ）を使用と登録できない' do
      @user.sei = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sei 全角（漢字・ひらがな・カタカナ）を使用してください')
    end
    it '名(mei)が全角（漢字・ひらがな・カタカナ）を使用と登録できない' do
      @user.mei = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Mei 全角（漢字・ひらがな・カタカナ）を使用してください')
    end
    it '姓_カナ(sei_kana)が全角（カタカナ）を使用と登録できない' do
      @user.sei_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sei kana 全角（カタカナ）を使用してください')
    end
    it '名_カナ(mei_kana)が全角（カタカナ）を使用と登録できない' do
      @user.mei_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Mei kana 全角（カタカナ）を使用してください')
    end
  end
end
