class UserOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :block, :building, :tele_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :block
    validates :tele_number, format: { with: /\A\d{11}\z/, message: 'is invalid' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, block: block, building: building, tele_number: tele_number, order_id: order.id)
  end
end
