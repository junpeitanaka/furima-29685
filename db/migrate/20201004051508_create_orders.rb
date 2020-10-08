class CreateOrders < ActiveRecord::Migration[6.0]

  include ActiveModel::Model
  attr_accessor :order_id,:postal_number, :prefecture_id, :city, :block, :building,:tele_number

  def change
    create_table :orders do |t|
      t.integer  :item_id,          null: false, foreing_key:true
      t.integer  :user_id,          null: false, foreign_key:true
      t.timestamps
    end
  end
end
