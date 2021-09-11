class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :tel_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :postal_code
    validates :municipalities
    validates :address
    validates :tel_number
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, tel_number: tel_number, order_id: order.id)
  end

end