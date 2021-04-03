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
      pay_item
      @order_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_buy).permit(:myouji,:namae,:kana_myouji,:kana_namae,:age,:postal_code, :area, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id, food_id: params[:food_id],token: params[:token]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @food.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
