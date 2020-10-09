require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_order.post_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post number can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.post_number = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @user_order.prefecture_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityがないと保存できるないこと' do
      @user_order.city = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'blockがないと保存できないこと' do
      @user_order.block = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Block can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @user_order.building = nil
      expect(@user_order).to be_valid
    end

    it '電話番号が空だと保存できないこと' do
      @user_order.tele_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Tele number can't be blank")
    end

    it '電話番号が半角数字でないと保存できないこと' do
      @user_order.tele_number = '0901234567a'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Tele number is invalid')
    end

    it 'トークンが取得されないと決済できないこと' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
