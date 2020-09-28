class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create 
    
    # ここに具体的なアクションを記述する
  end

  private

  def item_params
   params.require(:item).permit(:image)
  end
  
end
