class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :tel_number)
  end

end
