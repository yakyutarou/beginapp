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
    it 'tokenが空では登録できないこと' do
      
      @order_buy.token = nil
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Token can't be blank")
    end

    it '購入者は、全角（漢字・ひらがな・カタカナ）以外での登録ができない' do
    binding.pry
      @order_buy.myouji = 'satou'
      @order_buy.namae = 'hiroshi'
      @order.valid?
      expect(@order_buy.errors.full_messages).to include('Miyoji is invalid', 'Namae is invalid')
    end


    it '郵便番号が空だと保存できないこと' do
      @order_buy.postal_code = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Postal codeを入力してください", "Postal codeは不正な値です")
    end


  end
end