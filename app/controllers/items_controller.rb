class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #商品一覧機能で設定→@items = Item.order("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :shipping_fee_id, :area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
