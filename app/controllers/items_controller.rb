class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    # item.update(item_params)
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # item = Item.find(params[:id])
    # item.destroy
    # redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :shipping_fee_id, :area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  # def contributor_confirmation
    # redirect_to root_path unless current_user == @item.user
  # end

end
