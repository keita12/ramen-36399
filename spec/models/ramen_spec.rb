require 'rails_helper'

RSpec.describe Ramen, type: :model do
  before do
    @ramen = FactoryBot.build(:ramen)
  end
  describe '新規投稿'do
   context '投稿に成功する時' do
    it '内容に問題なければ投稿できる' do
      expect(@ramen).to be_valid
    end
    it 'テキストは空でも投稿できる' do
      @ramen.text = ''
      expect(@ramen).to be_valid
    end
   end
   context '投稿に失敗する時'do
    it '画像が空だと保存できない' do
      @ramen.image = nil
      @ramen.valid?
      expect(@ramen.errors.full_messages).to include "Image can't be blank"
    end
    it '店名が空だと保存できない' do
      @ramen.store_name = ''
      @ramen.valid?
      expect(@ramen.errors.full_messages).to include "Store name can't be blank"
    end
    it 'ラーメンの名前が空だと保存できない' do
      @ramen.ramen_name = ''
      @ramen.valid?
      expect(@ramen.errors.full_messages).to include "Ramen name can't be blank"
    end
    it '星の数は空だと保存できない' do
      @ramen.star_id = ''
      @ramen.valid?
      expect(@ramen.errors.full_messages).to include "Star can't be blank"
    end
    it '星の数はid1だと保存できない' do
      @ramen.star_id = 1
      @ramen.valid?
      expect(@ramen.errors.full_messages).to include "Star can't be blank"
    end
    it 'ユーザー情報がないと登録できない' do
      @ramen.user = nil
      @ramen.valid?
			expect(@ramen.errors.full_messages).to include "User must exist"
    end
   end
  end
end
