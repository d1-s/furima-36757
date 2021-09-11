class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    OrderForm.new
  end

  def create
  end
end
