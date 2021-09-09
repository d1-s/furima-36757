class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :send_days_id, :price).merge(user_id: current_user.id)
  end
end
