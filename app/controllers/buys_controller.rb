class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_shipment = BuyShipment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_shipment = BuyShipment.new(buy_params)
    if @buy_shipment.valid?
      pay_item
      @buy_shipment.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy_shipment).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end