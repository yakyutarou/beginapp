class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @order_buy = OrderBuy.new
    @food = Food.find(params[:food_id])
  end

  def create
    @order_buy = OrderBuy.new(order_params)
    @food = Food.find(params[:food_id])
    if @order_buy.valid?
      @order_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_buy).permit(:myouji,:namae,:kana_myouji,:kana_namae,:age,:postal_code, :area, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id])
     # クライアントサイド実装後一番最初にtoken: params[:token]を追加
   end
end
