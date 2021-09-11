class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
