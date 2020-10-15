class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :destroy, :update]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order('created_at DESC')
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :explanation,
                                 :category_id, :state_id, :fee_delivery_id, :area_delivery_id, :day_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
  
    redirect_to action: :index unless user_signed_in?
  end
end

