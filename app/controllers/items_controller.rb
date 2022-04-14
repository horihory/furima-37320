class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_buy, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(id: 'DESC')
    @buys = Buy.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_buy
    @buy = Buy.find_by(item_id: @item.id)
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
    redirect_to action: :index if @buy.present?
  end
end
