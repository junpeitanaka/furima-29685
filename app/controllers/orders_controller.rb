class OrdersController < ApplicationController

  def index
    
    @orders = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  
  def create
    @orders = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    
    if @user_order.valid?
       pay_item
       @user_order.save  
      return redirect_to root_path
    else
      render :index  
    end
  end
end

private
 def order_params
   params.permit(
     :token,
     :post_number, 
     :prefecture_id,
     :city, 
     :block, 
     :building,
     :tele_number,
     :item_id
     ).merge(user_id: current_user.id)
 end

 def pay_item
  @item = Item.find(params[:item_id])
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
   amount: @item.price,  
   card: order_params[:token],   
   currency: 'jpy'                 
   )
 end

 