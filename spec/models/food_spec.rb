require 'rails_helper'

RSpec.describe Food, type: :model do
  describe '#create' do
    before do
      @food = FactoryBot.build(:food)
    end

    context '食品登録ができるとき' do
      it '全ての項目があれば、登録できること' do
        expect(@food).to be_valid
      end
    end

    context '食品登録ができないとき' do
      it '食品画像を1枚つけないと登録できない' do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include '画像を入力してください'
      end

      it '食品名(food_name)が空だと登録できない' do
        @food.food_name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include('食品名を入力してください')
      end

      it '食品の説明(explanation)が空だと登録できない' do
        @food.explanation = ''
        @food.valid?
        expect(@food.errors.full_messages).to include('説明を入力してください')
      end

      it '値段についての情報(price)が空だと保存できない' do
        @food.price = ''
        @food.valid?
        expect(@food.errors.full_messages).to include('値段を入力してください')
      end

      it '食品の都道府県ついての情報(area)が未選択だと登録できない' do
        @food.area_id = 0
        @food.valid?
        expect(@food.errors.full_messages).to include('都道府県は0以外の値にしてください')
      end

      it '賞味期限についての情報(sell_by)が空だと保存できない' do
        @food.sell_by = ''
        @food.valid?
        expect(@food.errors.full_messages).to include('賞味期限を入力してください')
      end

      it '保存方法についての情報(food_hozon)が未選択だと登録できない' do
        @food.food_hozon_id = 1
        @food.valid?
        expect(@food.errors.full_messages).to include('保存方法は1以外の値にしてください')
      end

      it 'userが紐付いていないと保存できないこと' do
        @food.user = nil
        @food.valid?
        expect(@food.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
