class OrdersController < ApplicationController
  before_action :correct_user, only: [:index, :create]

  def index
    @orders = Item.find(params[:item_id])
    @user_order = UserOrder.new
    redirect_to root_path unless user_signed_in?
  end

  def create
    @orders = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
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
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
end

def correct_user
  @orders = Item.find(params[:item_id])
  redirect_to root_path if @orders.id == current_user
end
