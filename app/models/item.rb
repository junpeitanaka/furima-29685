class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :management

  with_options presence: true do
    validates :item_name
    validates :image
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width numbers' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area_delivery
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :fee_delivery
  belongs_to_active_hash :day_delivery

  with_options presence: true,numericality: { other_than: 1 } do
    validates :area_delivery_id 
    validates :category_id
    validates :state_id
    validates :fee_delivery_id
    validates :day_delivery_id
  end
end
