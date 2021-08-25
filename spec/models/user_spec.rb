require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーの新規登録できる時' do
   context '新規登録に成功する時' do
    it '内容に問題なければ登録できる' do
      expect(@user).to be_valid
    end
   end
   context 'ユーザーの新規登録ができない時' do
    it 'ニックネームが空だと保存できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailは空だと保存できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailは@がないと保存できない' do
      @user.email = 'aaa0323'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "重複したメールアドレスが存在すると保存できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'パスワードは空だと保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードとパスワード（確認）は、値の一致していないと保存できない' do
      @user.password = 'kkkk00'
      @user.password_confirmation = 'kkk000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードは6文字以上でないと保存できない' do
      @user.password = '333'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
  end
end
end
