class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :check_buyed_item, only: [:index]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id

  end

  def create
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

def set_item
  @item = Item.find(params[:item_id])
end

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

def check_buyed_item
  @item = Item.find(params[:item_id])
  if @item.order.present?
    redirect_to root_path
  end
end





