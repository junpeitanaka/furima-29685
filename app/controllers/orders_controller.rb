class OrdersController < ApplicationController

  def index
    
    @orders = Item.find(params[:item_id])
    @order = Order.new
  end
  
end

