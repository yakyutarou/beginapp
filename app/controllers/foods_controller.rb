class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :updete,:destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]
  before_action :save_params, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all.order('created_at DESC').limit(8)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to food_path
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:image, :food_name, :explanation, :price, :area_id, :sell_by,
                                 :food_hozon_id).merge(user_id: current_user.id)
  end

  def move_to_root_path
    redirect_to root_path unless current_user.nickname == "オーナー"
  end

  def save_params
    @food = Food.find(params[:id])
  end
 end
