class BuyShipment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/ }
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end