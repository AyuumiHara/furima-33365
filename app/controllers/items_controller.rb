class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  # before_action :move_to_index, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end

  end

  def destroy
    # if item.user_id == current_user.id
    @item.destroy
    redirect_to root_path
    # end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :shipping_fee_id, :area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    # if @item.user_id != current_user.id
    #   redirect_to action: :index
    # end
    redirect_to action: :index unless current_user.id == @item.user_id && @item.order.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
