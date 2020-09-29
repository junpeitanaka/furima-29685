class Item < ApplicationRecord

  
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :fee_delivery
  belongs_to_active_hash :day_delivery



  validates :prefecture, presence: true
  validates :category, presence: true
  validates :state, presence: true
  validates :fee_delivery, presence: true
  validates :day_delivery, presence: true


  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :fee_delivery_id, numericality: { other_than: 1 } 
  validates :day_delivery_id, numericality: { other_than: 1 } 



end
