class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
end