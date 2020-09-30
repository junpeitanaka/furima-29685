class Item < ApplicationRecord

  
  has_one_attached :image
  belongs_to :user
  has_one :management

  with_options presence: true do
    validates :item_name
    validates :user_id
    validates :explanation
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area_delivery
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :fee_delivery
  belongs_to_active_hash :day_delivery



  validates :area_delivery, presence: true
  validates :category_id, presence: true
  validates :state, presence: true
  validates :fee_delivery, presence: true
  validates :day_delivery, presence: true


  validates :area_delivery_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :fee_delivery_id, numericality: { other_than: 1 } 
  validates :day_delivery_id, numericality: { other_than: 1 } 



  
end