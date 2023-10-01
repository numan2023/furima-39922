class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_region_id, :city, :street, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :delivery_region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :street
    validates :tel, length: { minimum: 10, maximum: 11, message: "is too short" }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_region_id: delivery_region_id, city: city, street: street, building: building, tel: tel, order_id: order.id)
  end

end
