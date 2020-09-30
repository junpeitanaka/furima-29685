class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index]


  def new
    @item = Item.new
  end

  def create 
    @item = Item.find(item_params)
    if @item.save
      redirect_to action: :index
 #メソッドはfindなのかな？？

    else
      redirect_to controller: :items, action: :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
   params.require(:item).permit(:image,:item_name, :user_id, :explanation,
    :category_id, :state_id,:fee_delivery_id,:area_delivery_id,:day_delivery_id,:price)
  end
  

  
end


