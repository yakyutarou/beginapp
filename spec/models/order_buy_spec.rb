require 'rails_helper'

RSpec.describe OrderBuy, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @food = FactoryBot.create(:food)
    @order_buy = FactoryBot.build(:order_buy, user_id: @user.id, food_id: @food.id)
    sleep(1)
  end

  context '食品購入できるとき' do
    it '全ての項目があれば、購入できること' do
      expect(@order_buy).to be_valid
    end

    it '建物名(building_name)は空でも購入できること' do
      @order_buy.building_name = ''
      expect(@order_buy).to be_valid
    end

    it '電話番号は固定電話の形でも購入できること' do
      @order_buy.phone_number = '0724335678'
      expect(@order_buy).to be_valid
    end

    it '購入者は、miyojiとnamaeがあれば購入できる' do
      @order_buy.myouji = '佐藤'
      @order_buy.namae = '弘'
      expect(@order_buy).to be_valid
    end
  end

  context '食品購入できない時' do
    it 'tokenが空では購入できないこと' do
      @order_buy.token = nil
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Tokenを入力してください')
    end

    it '購入者名は空では購入できない' do
      @order_buy.myouji = ''
      @order_buy.namae = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Myoujiを入力してください', 'Myoujiは不正な値です', 'Namaeを入力してください', 'Namaeは不正な値です')
    end

    it '購入者は、全角（漢字・ひらがな・カタカナ）以外での購入はできない' do
      @order_buy.myouji = 'satou'
      @order_buy.namae = 'hiroshi'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Myoujiは不正な値です', 'Namaeは不正な値です')
    end

    it '購入者のフリガナが空だと購入できない' do
      @order_buy.kana_myouji = ''
      @order_buy.kana_namae = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Kana namaeを入力してください', 'Kana namaeは不正な値です', 'Kana myoujiを入力してください',
                                                         'Kana myoujiは不正な値です')
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）以外だと購入はできない' do
      @order_buy.kana_myouji = 'さs佐'
      @order_buy.kana_namae = 'ひhi弘'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Kana namaeは不正な値です', 'Kana myoujiは不正な値です')
    end

    it '郵便番号が空だと購入できないこと' do
      @order_buy.postal_code = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Postal codeを入力してください', 'Postal codeは不正な値です')
    end

    it '年齢が空だと購入できないこと' do
      @order_buy.age = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Ageを入力してください')
    end

    it '都道府県が空だと購入できないこと' do
      @order_buy.area = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Areaを入力してください')
    end

    it '市区町村は空では購入できないこと' do
      @order_buy.city = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Cityを入力してください')
    end

    it '町名・番地(address)は空では購入できないこと' do
      @order_buy.address = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Addressを入力してください')
    end

    it '電話番号(phone_number)は12桁以上だと購入できないこと' do
      @order_buy.phone_number = '123456789123'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Phone numberは不正な値です')
    end

    it '電話番号は9桁以下だと購入できない' do
      @order_buy.phone_number = '090234567'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Phone numberは不正な値です')
    end

    it 'user_idが空だと購入できない' do
      @order_buy.user_id = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Userを入力してください')
    end

    it 'food_idが空だと保存できない' do
      @order_buy.food_id = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Foodを入力してください')
    end
  end
end
