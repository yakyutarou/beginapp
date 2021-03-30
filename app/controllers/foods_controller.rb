class FoodsController < ApplicationController
  def index
    @foods = Food.all.order('created_at DESC')
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_paramas)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def food_paramas
    params.require(:food).permit(:image, :food_name, :explanation, :price, :area_id, :sell_by,
                                 :food_hozon_id).merge(user_id: current_user.id)
  end
end
