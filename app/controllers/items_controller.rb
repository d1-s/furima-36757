class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :send_days_id, :price).merge(user_id: current_user.id)
  end
end
