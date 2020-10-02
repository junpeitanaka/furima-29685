require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end

  describe '商品登録' do
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it '商品名がない場合は登録できないこと' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '画像がない場合は登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品説明がない場合は登録できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーを選択しなければ登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'カテゴリー1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


    it '商品状態を選択しなければ登録できないこと' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank", 'State is not a number')
    end

    it '商品状態1を選択すると登録できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end

    

    it '配送料の負担を選択しなければ登録できないこと' do
      @item.fee_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee delivery can't be blank", 'Fee delivery is not a number')
    end

    it '配送料の負担1を選択すると登録できないこと' do
      @item.fee_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee delivery must be other than 1")
    end

    it '配送元の地域を選択しなければ登録できないこと' do
      @item.area_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area delivery can't be blank", 'Area delivery is not a number')
    end

    it '配送元の地域1を選択すると登録できないこと' do
      @item.area_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area delivery must be other than 1")
    end

    it '発送までの日数の選択がなければ登録できないこと' do
      @item.day_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day delivery can't be blank", 'Day delivery is not a number')
    end

    it '発送までの日数の選択がなければ登録できないこと' do
      @item.day_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day delivery must be other than 1")
    end

    it '価格がない場合は登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Half-width numbers')
    end

    it '価格が数字でない場合は登録できないこと' do
      @item.price = 'abcd'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '値段が10,000,000以上の場合は登録できないこと' do
      @item.price = '12345678'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '値段が300以下の場合は登録できないこと' do
      @item.price = '123'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    
  end
end
